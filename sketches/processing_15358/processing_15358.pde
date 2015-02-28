

class Bee {

  int radius; // rayon de base
  float speedrot; // vitesse de rotation
  float rot; // vitesse de rotation
  float var1; // variation de l'amplitude
  int var2a; // paramètre d'amplitude maximum
  float var2;
  int var3; // nombre de branches
  int xtrans;
  int ytrans;

  Bee(int radiusZ,float rotZ,float var1Z,int var2aZ,int var3Z,int xtransZ,int ytransZ)
  {
  radius=radiusZ;
  speedrot=0;
  rot=rotZ;
  var1=var1Z;
  var2a=var2aZ;
  var2=0.0;
  var3=var3Z;
  xtrans=xtransZ;
  ytrans=ytransZ;
  }  

void display()  {
  pushMatrix();  
  translate(xtrans,ytrans);  
  speedrot=speedrot+rot;  
  rotate(speedrot);


  var2=sin((radians ((frameCount % 25)*(360/25) ))) *var2a;


  if (var2 == 0) {
  var1=0;
  if (random(1,10)>9) {
        var2a=int(random(500,3000));
        var3=int(random(2,20));
    }
    
  }


  for (float deg=0; deg <360; deg+=1)  {
    float angle=radians(deg);
    var1=var1+(0.00001*var2);
    float radius1=(radius+(sin(angle*var3)*var1));
    float x=0+(cos(angle)*radius1);
    float y=0+(sin(angle)*radius1);
    ellipse(x,y,2,2);
    }
  popMatrix();
  }  
  
}


Bee bee1, bee2, bee3,bee4, bee5;

void setup(){
frameRate=25;
size(800,600);
bee1=new Bee(200,0.01,100,1000,6,400,300);
bee2=new Bee(220,-0.02,300,1500,8,400,300);
bee3=new Bee(100,0.05,200,2500,12,400,300);
bee4=new Bee(80,-0.008,400,500,4,400,300);
bee5=new Bee(150,-0.002,300,2500,5,400,300);
noStroke();
smooth();
}

void draw() {
fill(0,20);
rect(0,0,width,height);
fill(255);
bee1.display();
bee2.display();
bee3.display();
bee4.display();
bee5.display();
}  

