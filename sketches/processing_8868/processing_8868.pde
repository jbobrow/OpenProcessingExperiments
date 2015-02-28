
import traer.physics.*;  
ParticleSystem physics;  
Particle mouse;  
Particle[][] p;  
Spring[][] s;  
int pamount;
float pdist;
PFont font;
float tension;

void setup(){  
  size(600,600,P3D);  
  colorMode(RGB);
  smooth();
  font = loadFont("OCRAExtended-10.vlw");

  pamount = 7;
  pdist = (width-100)/pamount;

  physics=new ParticleSystem(0,0,1,0.01);  
  p=new Particle[pamount][pamount];  
  s=new Spring[pamount][pamount];  

  for(int i=0;i<pamount;i++){  
    for (int j=0;j<pamount;j++){
      p[i][j]=physics.makeParticle(1.0,i*pdist,j*pdist,0);  
      if(j>0){  
        s[i][j]=physics.makeSpring(p[i][j-1],p[i][j],1,0.7,30);  
      }  
    }
  }
  for(int j=0;j<pamount;j++){  
    for (int i=1;i<pamount;i++){

      s[i][j]=physics.makeSpring(p[i-1][j],p[i][j],1,0.7,30);  
    }
  }  

  p[0][0].makeFixed();  
  p[0][pamount-1].makeFixed();  
  p[pamount-1][0].makeFixed();  
  p[pamount-1][pamount-1].makeFixed();  
}  

void draw(){  
  noFill();
  background(75,17,41); 
  camera (600,200,600,width/2,height/2,0,1,1,1);
  textMode(SCREEN);
  textFont (font,10);
  stroke(255);
  textSize(24);
  text(">SPRING CABLE SIMULATION",10,540,400,200);
  textSize(10);
  text("Dicky Ferdiansyah & Christoph Waibel",10,560,400,200);
  text("ICD Studio Evolving Systems of Material and Performance",10,575,400,200);


  physics.tick();  
  p[0][0].position().set(pdist,pdist,0);  
  p[0][pamount-1].position().set(width-pdist,pdist,0);  
  p[pamount-1][0].position().set(pdist,height-pdist,0);  
  p[pamount-1][pamount-1].position().set(width-pdist,height-pdist,0);

  ellipseMode(CENTER);
  textMode(MODEL);
  noFill();
  stroke(255);
  for (int i=0;i<pamount;i++){
    for (int j=0;j<pamount;j++){
      ellipse(p[i][j].position().x(),p[i][j].position().y(),10,10);
      if(i>0||i==pamount-1){
        tension = 1*dist(p[i-1][j].position().x(),p[i-1][j].position().y(),p[i][j].position().x(),p[i][j].position().y());
        textSize (20);
        text(int(tension),p[i][j].position().x(),p[i][j].position().y(),0);
      }
    }
  }
  noFill();
  stroke(255);


  for (int i=0;i<pamount;i++){
    beginShape(); 
    curveVertex (p[i][0].position().x(),p[i][0].position().y());
    for (int j=0;j<pamount;j++){
      curveVertex (p[i][j].position().x(),p[i][j].position().y());
    }
    curveVertex (p[i][pamount-1].position().x(),p[i][pamount-1].position().y());  
    endShape();   
  }


  for (int j=0;j<pamount;j++){
    beginShape();  
    curveVertex (p[0][j].position().x(),p[0][j].position().y());
    for (int i=0;i<pamount;i++){
      curveVertex (p[i][j].position().x(),p[i][j].position().y());
    }
    curveVertex (p[pamount-1][j].position().x(),p[pamount-1][j].position().y());  
    endShape(); 
  }



}
void mousePressed(){
  p[pamount/2][pamount/2].makeFixed();
  p[pamount/2][pamount/2].position().set(mouseX,mouseY,0);
}

void mouseDragged(){  
  p[pamount/2][pamount/2].position().set(mouseX,mouseY,0);
}  

void mouseReleased(){
  p[pamount/2][pamount/2].makeFree();
}  



































