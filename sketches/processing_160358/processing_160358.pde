
String [] palavras = {"VERÁS QUE UM FILHO TEU NÃO FOGE A LUTA", "PAÍS EM MANUTENÇÃO", "REFORMA POLÍTICA"};
 
     
    void setup(){
      size(500,600);
      PFont font = loadFont ("BrowalliaUPC-30.vlw");
      
      textFont(font);
      smooth();
      textAlign(LEFT);
      
     
    }
     
    void draw(){
       
      background(0);
      balancando(120);
      balancando(120.3);
      balancando(120.5);
       frameRate(1.5);
       
       
    }

    void balancando(float rot){ 
        pushMatrix(); 
       // float angle = atan2(50,50); 
        translate(10, 30);
        rotate(rot);
        
        fill(255);
        textSize(25);
        text(palavras[int(random(0, palavras.length))],0,0); 
        popMatrix();
       
       }
