
PFont font;
            boolean mouse;
            float angle = 1.0;

            String [] palavras = {"verás", "que", "um", "filho", "teu", "não", "foge", "a", "luta", "reforma", "política", "vem", "pra", "rua", "anticopa", "copa", "pra", "quem", "?", "meu", "partido", "é", "um",
                                  "coração", "partido", "tem", "tanta", "coisa", "errada", "que", "não", "cabe", "em", "um", "cartaz", "queremos", "hospitais", "escolas", "padrão", "fifa", "uma",
                                  "sociedade", "consciente", "é", "o", "maior", "medo", "do", "governo", "país", "em", "manutenção", "não", "aguentamos", "mais", "tanta", "corrupção", "grito", "popular",
                                  "protesto", "contra", "aumento", "da", "copa", "eu", "abro", "mão", "dinheiro", "saúde", "educação"};

             
            void setup(){
            size(500,600);
            smooth();
            font = loadFont("Andalus-48.vlw");
            textFont(font);
            background(0);

            }
             
            void draw(){
                frameRate(6);
                pushMatrix();
                translate(mouseX, mouseY);
                rotate(angle);
                fill(255);
                textSize(30);
                text(palavras[int(random(0, palavras.length))], width/50, height/50);
                angle += 0.01;
                popMatrix();
                translate(mouseX, mouseY);
                rotate(angle);
                fill(#333555);
                textSize(10);
                text("Copa", width/20, height/20);
                angle -= 2.5;                   
            }
            void mousePressed(){
                noLoop();
            }
