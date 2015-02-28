
 

//julio33
//julio108@gmail.com

/* 
a

*/


 float i_x=0,a_x=1, ciclo_x=100;
  float i_y=0,a_y=1, ciclo_y=100;
   float i_z=0,a_z=1, ciclo_z=100;
int c=0; float extra;
void setup () {
  size(200,200,P3D);       
 
  background(255,255,255);
translate (100,100,0);
pushMatrix();

}



void draw () {

 popMatrix();

    if (mousePressed == true){ciclo_x=0;ciclo_y=0;ciclo_z=0;}
   
ciclo_x--; if (ciclo_x<1){ i_x= random(100); ciclo_x=random(1000);}
if (i_x>100) a_x=-1;
if (i_x<-100) a_x=1;
i_x+=a_x;
 rotateX((-i_x/2000.0)    );


ciclo_y--; if (ciclo_y<1){ i_y= random(100); ciclo_y=random(1000);}
if (i_y>100) a_y=-1;
if (i_y<-100) a_y=1;
i_y+=a_y;
 rotateY((-i_y/2000.0)     );

ciclo_z--; if (ciclo_z<1){ i_z= random(100); ciclo_z=random(1000);}
if (i_z>100) a_z=-1;
if (i_z<-100) a_z=1;
i_z+=a_z;
 rotateZ((-i_z/2000.0)         );





// print(i + "   \n");
// rotateY(-i/900.0 );
//  rotateZ(-i/900.0 );
// rotateY((sin(i)*2-tan(i))/50.0 );
// rotateZ((cos(i)-sin(i))/50.0 );
 
 
 //FLICKERING
// c++;
// if(c==7){   background(255,255,255); c=0;}
 background(255,255,255);
 
 

//stroke(i_z/2, i_y/2, i_x/2,i_x+i_y+i_z);
//stroke(i_z/2, i_y/2, i_x/2);
stroke(204, 102, 0);


strokeWeight(4);   // Thicker



box(90,90,90);

  pushMatrix();
 
 
}

