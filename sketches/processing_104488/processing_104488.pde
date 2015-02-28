
void setup(){
  size(1000,400);
  background(54,173,245);}
  
void draw()
{background(54,173,245);



noStroke();
fill(55,130,50);
ellipse(900,400,400,350); //montanha I
fill(64,137,61);
ellipse(700,400,400,300); // montanha II

noStroke();
fill(255,249,45);
ellipse(100,100,100,100); // SOL


fill(8,38,103);
quad(-10,320,1000,320,1000,410,-10,410); // MAR

for (int i =320; i<400; i +=1) {
  if(i < 321) {
 stroke(24,100,180);
    line(-10,i,1000,i);
  } else if(i<327){ 
   stroke(23,95,219);
    line(-10,i,1000,i);
    } else if(i<330){ 
   stroke(22,90,210);
    line(-10,i,1000,i);
    } else if(i<334){ 
   stroke(21,85,203);
    line(-10,i,1000,i);
    } else if(i<338){ 
   stroke(20,80,190);
    line(-10,i,1000,i);
    } else if(i<342){ 
   stroke(19,75,180);
    line(-10,i,1000,i);
    } else if(i<346){ 
   stroke(18,70,170);
    line(-10,i,1000,i);
    } else if(i<350){ 
   stroke(17,65,160);
    line(-10,i,1000,i);
    } else if(i<354){ 
   stroke(16,60,157);
    line(-10,i,1000,i);
    } else if(i<357){ 
   stroke(15,55,144);
    line(-10,i,1000,i);
    } else if(i<359){ 
   stroke(14,50,131);
    line(-10,i,1000,i);
    } else if(i<362){ 
   stroke(13,45,120);
    line(-10,i,1000,i);
    } else if(i<366){ 
   stroke(12,40,111);
    line(-10,i,1000,i);
    } else if(i<369){ 
   stroke(11,35,101);
    line(-10,i,1000,i);
    } else if(i<373){ 
   stroke(11,30,90);
    line(-10,i,1000,i);
    } else if(i<375){ 
   stroke(10,25,81);
    line(-10,i,1000,i);
    } else if(i<380){ 
   stroke(9,20,70);
    line(-10,i,1000,i);
     } else if(i<383){ 
   stroke(8,15,60);
    line(-10,i,1000,i);
    } else if(i<386){ 
   stroke(7,10,50);
    line(-10,i,1000,i);
    } else if(i<390){ 
   stroke(6,5,40);
    line(-10,i,1000,i);
    } else if(i<394){ 
   stroke(5,5,30);
    line(-10,i,1000,i);
    } else if(i<397){ 
   stroke(5,5,20);
    line(-10,i,1000,i);
    } else{ 
   stroke(5,5,15);
    line(-10,i,1000,i);
  }
}

noStroke();
fill(54,173,245);
int x;
for (x=1; x<530; x=x+15)
ellipse(x,315,20,20); //ondas - céu

fill(64,137,61);
int z;
for (z=550; z<865; z=z+15)
ellipse(z,315,20,20); // ondas - montanha I

fill(55,130,50);
int y;
for (y=880; y<1100; y=y+15)
ellipse(y,315,20,20); // ondas - montanha II



stroke(0);

fill(211,4,18);
quad(mouseX-350,300,mouseX,300,mouseX-50,350,mouseX-300,350); // Parte Inferior
quad(mouseX-181,100,mouseX-169,100,mouseX-169,300,mouseX-181,300); // Mastro
fill(255);
quad(mouseX-168,100,mouseX-20,295,mouseX-20,295,mouseX-168,295); // Vela - Direita
quad(mouseX-182,150,mouseX-182,295,mouseX-330,295,mouseX-182,150); // Vela - Esquerda



}



