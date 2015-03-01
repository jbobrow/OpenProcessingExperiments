
    import processing.dxf.*;

    

    
    import processing.pdf.*;
    
    PImage img;
    PImage cml;
    PImage csg;
    float angulo;
    
    
    
  void setup (){
    println ("Carregando...");
    background (255);
    size (1000,1000,PDF,"Nova Capa.pdf");
    noStroke();
    
    img = loadImage("helloween03.png");
    csg = loadImage("chameleon.png");
    angulo = 0.01;
  
   
  }
  
 
    void draw (){
    
   
    image(img, 155, 150,width/1.35, height/6); // LOCALIZAÃ‡AO DAS IMAGENS
    image(csg,-20,0);
    angulo += 5;
    rotate (radians (angulo));
 
 
     //abaixo estÃ£o os desenhos formados aleatoriamente
 
       fill (random (255),random (255),random(255),random(90,100));
        
beginShape(); //forma do canto direito inferior

      vertex(random (0,200),random (0,225));
      vertex(random (300,400),random (0,300));
      vertex(random (150,300),random (200,700));
endShape();
      
       fill (random (255),random (255),random(255),random(90,100));
        
beginShape(); //forma do canto direito inferior

      vertex(random (0,200),random (0,225));
      vertex(random (300,400),random (0,300));
      vertex(random (150,300),random (200,700));
endShape();
      
       fill (random (255),random (255),random(255),random(50,100));
    
 
          
beginShape(); //forma do canto esquerdo inferior

     vertex(random (200,700),random (500,800));
     vertex(random (350,700),random (900,1000));
     vertex(random (800,1000),random (200,1000));
               
endShape();

          
beginShape(); //forma do canto esquerdo inferior

     vertex(random (200,700),random (500,800));
     vertex(random (350,700),random (900,1000));
     vertex(random (800,1000),random (200,1000));
               
endShape();
          
beginShape(); //forma do canto esquerdo inferior

     vertex(random (200,700),random (500,800));
     vertex(random (350,700),random (900,1000));
     vertex(random (800,1000),random (200,1000));
               
endShape();
   

     
       fill (random (255),random (255),random(255),random(40,100));
beginShape(); //forma do canto direito superior
   
     vertex(random (700,1000),random (0,500));
     vertex(random (500,1000),random (0,500));
     vertex(random (500,1000),random (0,500));
               
endShape();


     
       fill (random (255),random (255),random(255),random(40,100));
beginShape(); //forma do canto direito superior
   
     vertex(random (700,1000),random (0,500));
     vertex(random (500,1000),random (0,500));
     vertex(random (500,1000),random (0,500));
               
endShape();

     
       fill (random (255),random (255),random(255),random(40,100));
beginShape(); //forma do canto direito superior
   
     vertex(random (700,1000),random (0,500));
     vertex(random (500,1000),random (0,500));
     vertex(random (500,1000),random (0,500));
               
endShape();

   println ("Pronto! Agora por favor abra o PDF da pasta destino para receber sua nova capa.");
   exit();

       
      
    }
    
