import 'package:felipe_brostolin_ribeiro_prova04/cadastro/cadastro_page.dart';
import 'package:felipe_brostolin_ribeiro_prova04/core/enviroments.dart';
import 'package:felipe_brostolin_ribeiro_prova04/ranking/ranking_page.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  final String cidade, nome, curso;

  const PerfilPage(
      {super.key,
      required this.cidade,
      required this.nome,
      required this.curso});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  final cidadeController = TextEditingController();
  final nomeController = TextEditingController();
  final cursoController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    cidadeController.value = TextEditingValue(text: widget.cidade);
    cursoController.value = TextEditingValue(text: widget.curso);
    nomeController.value = TextEditingValue(text: widget.nome);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset("assets/Logo.png"),
              ),
              InkWell(
                child: Container(
                  child: const Center(
                      child: Text(
                    "Perfil",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
                  decoration: BoxDecoration(color: Colors.blue[300]),
                  height: 100,
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const RankingPage()),
                  );
                },
                child: Container(
                  child: const Center(
                      child: Text(
                    "Ranking",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 100,
                ),
              ),
              const Divider(),
              InkWell(
                child: Container(
                  child: const Center(
                      child: Text(
                    "Disciplinas",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 100,
                ),
              ),
              const Divider(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white),
                    onPressed: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.logout,
                        ),
                        Text("Log out"),
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Column(
                children: [
                  CircleAvatar(
                    radius: 32,
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 52,
                    ),
                  ),
                  Text(
                    "Perfil",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nomeController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Nome Completo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: cidadeController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Cidade",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: cursoController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                      readOnly: true,
                      enabled: false,
                      decoration: InputDecoration(
                        fillColor: Colors.grey[200],
                        filled: true,
                        labelText: "Curso",
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Mudar Senha"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            cidadeVar = cidadeController.text;
                            nomeVar = nomeController.text;

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Dados Atualizados com sucesso!"),
                              ),
                            );
                          }
                        },
                        child: const Text("Atualizar"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
