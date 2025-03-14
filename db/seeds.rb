require 'open-uri'

# Limpa os dados existentes
Badge.destroy_all
Category.destroy_all

# Cria categorias
categories = [
  { name: "Esportes", description: "Emblemas relacionados a esportes" },
  { name: "Música", description: "Emblemas relacionados a música" },
  { name: "Tecnologia", description: "Emblemas relacionados a tecnologia" },
  { name: "Filmes", description: "Emblemas relacionados a filmes" },
  { name: "Jogos", description: "Emblemas relacionados a jogos" },
  { name: "Livros", description: "Emblemas relacionados a literatura" },
  { name: "Ciência", description: "Emblemas relacionados a ciência e descoberta" },
  { name: "Carros", description: "Emblemas relacionados a automóveis" },
  { name: "Natureza", description: "Emblemas de elementos naturais" },
  { name: "Comida", description: "Emblemas relacionados a gastronomia" },
  { name: "Animes", description: "Emblemas de animes populares" },
  { name: "Séries", description: "Emblemas de séries famosas" },
  { name: "História", description: "Emblemas relacionados a fatos históricos" },
  { name: "Espaço", description: "Emblemas do universo e astronomia" },
  { name: "Bebidas", description: "Emblemas de bebidas famosas" },
  { name: "Arte", description: "Emblemas de grandes obras de arte" },
  { name: "Moda", description: "Emblemas do mundo fashion" },
  { name: "Animais", description: "Emblemas de animais icônicos" },
  { name: "Super-heróis", description: "Emblemas de heróis e vilões" },
  { name: "Memes", description: "Emblemas de memes populares" }
]

categories.each do |cat|
  Category.create!(cat)
end

# Lista de imagens reais com URLs funcionais
image_urls = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Football_%28soccer_ball%29.svg/800px-Football_%28soccer_ball%29.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7a/Basketball.png/800px-Basketball.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/Tennis_ball.svg/800px-Tennis_ball.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bf/Volleyball_Clipart.svg/800px-Volleyball_Clipart.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/Rock_on_hand.svg/800px-Rock_on_hand.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Saxophone.svg/800px-Saxophone.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Piano_keyboard.svg/800px-Piano_keyboard.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/GuitareClassique5.png/800px-GuitareClassique5.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Ruby_logo.svg/800px-Ruby_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c3/Python-logo-notext.svg/800px-Python-logo-notext.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Unofficial_JavaScript_logo_2.svg/800px-Unofficial_JavaScript_logo_2.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/61/HTML5_logo_and_wordmark.svg/800px-HTML5_logo_and_wordmark.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6c/Star_Wars_Logo.svg/800px-Star_Wars_Logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/DC_Comics_logo.png/800px-DC_Comics_logo.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ea/Superman_shield.svg/800px-Superman_shield.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6e/Harry_Potter_wordmark.svg/800px-Harry_Potter_wordmark.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/800px-Marvel_Logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/3/32/Minecraft_logo.svg/800px-Minecraft_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/FortniteLogo.svg/800px-FortniteLogo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/International_Pok%C3%A9mon_logo.svg/800px-International_Pok%C3%A9mon_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/a/a2/SL_Benfica_logo.svg/800px-SL_Benfica_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg/800px-FC_Bayern_M%C3%BCnchen_logo_%282017%29.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/7/7a/Manchester_United_FC_crest.svg/800px-Manchester_United_FC_crest.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/e/eb/Manchester_City_FC_badge.svg/800px-Manchester_City_FC_badge.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/c/cc/FC_Barcelona_logo.svg/800px-FC_Barcelona_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/800px-Real_Madrid_CF.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fe/Apple_logo_black.svg/800px-Apple_logo_black.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Google_2015_logo.svg/800px-Google_2015_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/IBM_logo.svg/800px-IBM_logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Firefox_logo%2C_2019.svg/800px-Firefox_logo%2C_2019.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Logo_of_YouTube_%282015-2017%29.svg/800px-Logo_of_YouTube_%282015-2017%29.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a5/Instagram_icon.png/800px-Instagram_icon.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6f/Logo_of_Twitter.svg/800px-Logo_of_Twitter.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/800px-Facebook_Logo_%282019%29.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Netflix_Logo.png/800px-Netflix_Logo.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Amazon_Logo.svg/800px-Amazon_Logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Wikimedia-logo.png/800px-Wikimedia-logo.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e9/Notion-logo.svg/800px-Notion-logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Npm-logo.svg/800px-Npm-logo.svg.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e0/Git-logo.svg/800px-Git-logo.svg.png"
]

# Cria 100 badges aleatórios
100.times do |i|
  Badge.create!(
    name: "Emblema #{i+1}",
    description: "Descrição do emblema #{i+1}",
    price: rand(5.0..30.0).round(2),
    image_url: image_urls.sample,
    category: Category.all.sample
  )
end

puts "Seed concluído com sucesso! 20 categorias e 100 badges criados."