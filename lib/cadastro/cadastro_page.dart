import 'package:felipe_brostolin_ribeiro_prova04/core/curso.dart';
import 'package:felipe_brostolin_ribeiro_prova04/core/enviroments.dart';
import 'package:felipe_brostolin_ribeiro_prova04/perfil/perfil_page.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final cidadeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarSenhaController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? curso;
  final listCursos = [
    Curso(
        id: 1,
        nomeCurso: "Técnico em Desenvolvimento de Sistemas",
        area: "Tecnologia"),
    Curso(id: 2, nomeCurso: "Técnico em Administração", area: "Gestão"),
    Curso(id: 3, nomeCurso: "Técnico em Enfermagem", area: "Saúde"),
    Curso(id: 4, nomeCurso: "Técnino em Elétrica", area: "Indústria"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset("assets/Logo.png"),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
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
                    DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) {
                          return "Campo Obrigatório";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Curso",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                      ),
                      items: [
                        const DropdownMenuItem(
                          value: null,
                          child: Text("Selecione um curso"),
                        ),
                        DropdownMenuItem(
                          value: listCursos[0],
                          child: Text(listCursos[0].nomeCurso),
                        ),
                        DropdownMenuItem(
                          value: listCursos[1],
                          child: Text(listCursos[1].nomeCurso),
                        ),
                        DropdownMenuItem(
                          value: listCursos[2],
                          child: Text(listCursos[2].nomeCurso),
                        ),
                        DropdownMenuItem(
                          value: listCursos[3],
                          child: Text(listCursos[3].nomeCurso),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          curso = value?.nomeCurso;
                        });
                      },
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Email",
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
                      obscureText: true,
                      controller: senhaController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        }
                        if (value != confirmarSenhaController.text) {
                          return "As senhas não coincidem";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Senha",
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
                      obscureText: true,
                      controller: confirmarSenhaController,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Campo obrigatório";
                        }

                        if (value != senhaController.text) {
                          return "As senhas não coincidem";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText: "Confirmar Senha",
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
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          cursoVar = curso!;
                          cidadeVar = cidadeController.text;
                          nomeVar = nomeController.text;
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => PerfilPage(
                                  cidade: cidadeController.text,
                                  nome: nomeController.text,
                                  curso: curso!),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text("Cadastrar-se"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
