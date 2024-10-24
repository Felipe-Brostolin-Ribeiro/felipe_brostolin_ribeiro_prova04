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
                  child: Center(
                      child: Text(
                    "Perfil",
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  )),
                  decoration: BoxDecoration(color: Colors.white),
                  height: 100,
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {},
                child: Container(
                  child: Center(
                      child: Text(
                    "Ranking",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  )),
                  decoration: BoxDecoration(color: Colors.blue[300]),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Icon(
                  Icons.trending_up,
                  size: 42,
                ),
                Text("Ranking - Paraná"),
              ],
            ),
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
                            Text("${index+1} -", style: TextStyle(fontSize: 12),),
                            CircleAvatar(radius: 32, child: Icon(Icons.account_circle_outlined, size: 40,),),
                            Text("${listAlunos[index].nome}", style: TextStyle(fontSize: 16),),
                            Spacer(),
                            Text("${listAlunos[index].pontos}pts", style: TextStyle(fontSize: 16),),
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
