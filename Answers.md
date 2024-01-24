## Expliquez ce qu’est LazyVGrid et pourquoi on l’utilise.
LazyVGrid est un conteneur de disposition dans SwiftUI qui organise ses éléments enfants en une grille verticale. 
LazyVGrid ne crée que les vues qui sont actuellement visibles à l'écran.

## Expliquez les différents types de colonnes et pourquoi on utilise flexible ici.
.flexible : Les colonnes flexibles s'adaptent à l'espace disponible.

.adapatative : Les colonnes adaptatives ajustent dynamiquement leur taille en fonction de l'espace disponible.
Il faut spécifier une largeur minimale pour chaque colonne adaptative. Si la largeur minimale est atteinte, une nouvelle colonne est ajoutée.

.fix : Les colonnes fixes ont une taille constante, indépendamment de l'espace disponible.
Vous spécifiez la taille fixe

## Votre grille ne doit pas être très jolie, expliquez pourquoi les images prennent toute la largeur de l’écran
Ils prennent toute la largeur de l'écran car les colonne sont flexible et donc prennent toute la place disponnible 

## Expliquer ce que fait ce modifier ligne par ligne
Il contient une fonction.
.resizable() : est utilisée sur une vue Image pour indiquer que l'image doit être redimensionnable. 

.scaledToFill() : est utilisée pour spécifier comment l'image doit remplir son cadre tout en conservant ses proportions d'origine.Souvent utilisé avec resizable.

.frame(width: geo.size.width, height: geo.size.height) : Permet de spécifier la taille de l'image 

.clipped() : est utilisée pour rogner une vue, généralement une image, afin de la confiner à une forme ou à un cadre spécifique.

## Expliquez les différences entre ces 3 méthodes.

async/await est une approche native introduite dans Swift pour simplifier la programmation asynchrone.
Avantages : Facilité d'utilisation, code plus lisible, gestion naturelle des erreurs.

Combine est un framework introduit par Apple pour la programmation réactive en Swift. Il fournit un ensemble d'opérateurs pour travailler avec des flux de données asynchrones et combine des valeurs au fil du temps.
Avantages : Programmation déclarative, manipulation puissante des flux de données, traitement des erreurs intégré.

Les completionHandler et GCD sont des approches plus traditionnelles pour gérer l'asynchronicité.
Avantages : Contrôle fin sur la concurrence, flexibilité





