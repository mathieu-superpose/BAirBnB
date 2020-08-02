# BAirBnB v1.0
_l'app pour squatter à tous les prix'_

## Application

Architecture de base de données d'une app de de réservation de logement sur le modèle d'AirBnB, créée dans le cadre de The Hacking Project

## Modèle entité-association (ERD en anglais)

![](bairbnb.png?raw=true)


## Installation

- Pre-Installer bundle et gem dépendencies.
  ```
  bundle install
  bundle update
  ```
- Configuration de base de donnée.
  
  On utilise le postgres comme le base de donnée. Pour exécuter ce projet avec votre potgres en local, vous devez avoir ou créer un utilisateur pour le postgres.

  >username: postgres
  >password: postgres

  Si vous ne voulez pas configurer cet utilisateur sur votre ordinateur. Il faudrait juste remplacer votre utilisateur dans le fichier `config/database.yml`

  ```yml
  development:
  <<: *default
  database: bairbnb_development
  host: localhost
  username: <<your-user-name>>
  password: <<your-password>>
  ```

- Exécuter le base de donnée sur votre ordinateur
  
  ```bash
  rails db:create #ou rails db:create:all #ou rake db:create:all
  rails db:migrate
  ```


## Contributeurs

- [:fire: Stanislas BASQUIN](https://github.com/StanislasBASQUIN)
- [:v: Tien Duy NGUYEN](https://github.com/tienduy-nguyen)
- [:v: Hugo Péran Séjourné](https://github.com/HugoPeranSejourne)
- [:seedling: Mathieu JOLY](https://github.com/mathieu-superpose)
