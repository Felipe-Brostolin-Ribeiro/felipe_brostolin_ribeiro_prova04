import 'package:felipe_brostolin_ribeiro_prova04/cadastro/cadastro_page.dart';
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
                  child: Center(
                      child: Text(
                    "Perfil",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
                  decoration: BoxDecoration(color: Colors.blue[300]),
                  height: 100,
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RankingPage()),
                  );
                },
                child: Container(
                  child: Center(
                      child: Text(
                    "Ranking",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                  decoration: BoxDecoration(color: Colors.white),
                  height: 100,
                ),
              ),
              Divider(),
              InkWell(
                child: Container(
                  child: Center(
                      child: Text(
                    "Disciplinas",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                  decoration: BoxDecoration(color: Colors.white),
                  height: 100,
                ),
              ),
              Divider(),
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
              Column(
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
              SizedBox(
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
                      decoration: InputDecoration(
                        labelText: "Nome Completo",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
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
                      decoration: InputDecoration(
                        labelText: "Cidade",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
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
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Mudar Senha"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Dados Atualizados com sucesso!"),
                              ),
                            );
                          }
                        },
                        child: Text("Atualizar"),
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
