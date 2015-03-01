
PFont font;
 
            String [] iniciais = {"A", "O", "Em", "E", "Política", "Queremos", "Professor", "Verás"};
            String [] principais = {"reforma", "política", "tanta", "coisa", "errada", "cabe", "cartaz", "queremos", "hospitais", "fifa", "escolas", 
                                    "luta", "professor", "saúde", "sálario", "deputado", "jogador", "futebol", "anticopa", "governo", "medo", "verás",
                                    "filho", "não", "foge", "rua", "partido", "dinheiro", "grito", "popular", "país", "protesto", "abro", "tanta"};
            String [] rimas = {"padrão", "educação", "coração", "corrupção", "manutenção", "mão"};
            String [] artigos = {"a", "de", "em", "por", "ao", "no", "na", "da", "pelo", "um", "uma", "que", "teu", "mais"};                        
             
            void setup(){
              size(500, 600);
              smooth();
              background(0);
              fill(255);
              textAlign( CENTER );
              font = loadFont("CourierNewPSMT-48.vlw");
              textFont(font, 32);
               text( iniciais[int(random(0, iniciais.length))]+" "+principais[int(random(0, principais.length))]+" "+artigos[int(random(0, artigos.length))]+" "+rimas[int(random(0, rimas.length))]+ "\n"+
                principais[int(random(0, principais.length))]+" "+artigos[int(random(0, artigos.length))]+" "+rimas[int(random(0, rimas.length))]+" \n"+
                principais[int(random(0, principais.length))]+" "+principais[int(random(0, principais.length))]+" "+artigos[int(random(0, artigos.length))]+" "+rimas[int(random(0, rimas.length))], width/2, height/4+100);
            }
               
            void draw(){
              if( mousePressed){
                background(0);
                text( iniciais[int(random(0, iniciais.length))]+" "+principais[int(random(0, principais.length))]+" "+artigos[int(random(0, artigos.length))]+" "+rimas[int(random(0, rimas.length))]+ "\n"+
                principais[int(random(0, principais.length))]+" "+artigos[int(random(0, artigos.length))]+" "+rimas[int(random(0, rimas.length))]+" \n"+
                principais[int(random(0, principais.length))]+" "+principais[int(random(0, principais.length))]+" "+artigos[int(random(0, artigos.length))]+" "+rimas[int(random(0, rimas.length))], width/2, height/4+100);
               }
            }
