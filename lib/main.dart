import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Temas Bíblicos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ThemeSelectionPage(),
    );
  }
}

class ThemeSelectionPage extends StatelessWidget {
  final Map<String, List<String>> themes = {
    'Amor': [
      'João 3:16 - Porque Deus tanto amou o mundo...',
      '1 Coríntios 13:4-7 - O amor é paciente, é bondoso...'
    ],
    'Gratidão': [
      '1 Tessalonicenses 5:18 - Dêem graças em todas as circunstâncias...',
      'Salmos 107:1 - Dêem graças ao Senhor, porque ele é bom...'
    ],
    'Aniversário': [
      'Salmos 139:13-14 - Pois tu criaste o meu íntimo...',
      'Provérbios 9:11 - Pois por meu intermédio os seus dias serão multiplicados...'
    ],
    'Fé': ['Mateus 15:28', 'Romanos 4:17-22'],
    'Liberdade': ['João 8: 31,32 ', 'Galatas 5: 13-14'],
    'cura': [
      'Exodo 15:26',
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('                Escolha um Tema'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: themes.keys.length,
          itemBuilder: (context, index) {
            String theme = themes.keys.elementAt(index);
            return Card(
              color: const Color.fromARGB(255, 18, 192, 204)
                  .withOpacity(0.8), // Transparência para destaque
              child: ListTile(
                title: Text(theme),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReferencesPage(
                        theme: theme,
                        references: themes[theme]!,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class ReferencesPage extends StatelessWidget {
  final String theme;
  final List<String> references;

  ReferencesPage({required this.theme, required this.references});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Referências sobre $theme'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/3.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: references.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 18, 204, 195).withOpacity(0.8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  references[index],
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
