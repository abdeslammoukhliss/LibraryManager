import 'package:flutter/material.dart';

import 'drawer_widget.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        title: Text('À propos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Bibliothèque Publique',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Notre bibliothèque publique offre une large sélection de livres, magazines, '
                    'et ressources numériques pour tous les âges. Nous nous engageons à promouvoir '
                    'la lecture, l\'éducation et l\'accès à l\'information pour notre communauté.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Adresse:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '123 Rue de la Bibliothèque\n'
                    '75001 Paris, France',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Contact:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Téléphone: 0689442223\n'
                    'Email: abdomokh@gmail.fr',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              Text(
                'Heures d\'ouverture:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Lundi - Vendredi: 9h00 - 18h00\n'
                    'Samedi: 10h00 - 16h00\n'
                    'Dimanche: Fermé',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
