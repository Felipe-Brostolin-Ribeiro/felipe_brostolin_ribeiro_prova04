import 'package:felipe_brostolin_ribeiro_prova04/core/enviroments.dart';
import 'package:felipe_brostolin_ribeiro_prova04/perfil/perfil_page.dart';
import 'package:felipe_brostolin_ribeiro_prova04/ranking/aluno_ranking.dart';
import 'package:flutter/material.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final listAlunos = [
    AlunoRanking(nome: "Thiago Costa", pontos: 640),
    AlunoRanking(nome: "Victor Barbosa", pontos: 145),
    AlunoRanking(nome: "Arthur Silva", pontos: 140),
    AlunoRanking(nome: "Marcos Silva", pontos: 140),
    AlunoRanking(nome: "Henrique Oliveira", pontos: 138),
    AlunoRanking(nome: "Diego Santos", pontos: 135),
    AlunoRanking(nome: "Caio Mendes", pontos: 135),
    AlunoRanking(nome: "Matheus Lima", pontos: 132),
    AlunoRanking(nome: "João Lima", pontos: 130),
    AlunoRanking(nome: "Rafael Souza", pontos: 130),
    AlunoRanking(nome: "Rafael Souza", pontos: 130),
  ];

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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => PerfilPage(
                            cidade: cidadeVar!,
                            nome: nomeVar!,
                            curso: cursoVar!)),
                  );
                },
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 100,
                  child: const Center(
                      child: Text(
                    "Perfil",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                ),
              ),
              const Divider(),
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(color: Colors.blue[300]),
                  height: 100,
                  child: const Center(
                      child: Text(
                    "Ranking",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
                ),
              ),
              const Divider(),
              InkWell(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: 100,
                  child: const Center(
                      child: Text(
                    "Disciplinas",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Column(
              children: [
                Icon(
                  Icons.trending_up,
                  size: 42,
                ),
                Text("Ranking - Paraná", style: TextStyle(fontSize: 24),),
              ],
            ),
            SizedBox(height: 24,),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 80,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              "${index + 1} -",
                              style: const TextStyle(fontSize: 16),
                            ),
                            const CircleAvatar(
                              radius: 32,
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 40,
                              ),
                            ),
                            Text(
                              listAlunos[index].nome,
                              style: const TextStyle(fontSize: 16),
                            ),
                            const Spacer(),
                            Text(
                              "${listAlunos[index].pontos}pts",
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
