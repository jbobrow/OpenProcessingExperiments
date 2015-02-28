
void setup () {
size(400,400);
background(280,280,100);
/*boday*/
rect(100,320,200,80);
/*neck*/
rect(150,300,100,30);

/*head*/
ellipse(200,220,200,190);

/*left eye*/
noFill();
ellipse(150,200,100,100);

/*right eye*/
noFill();
ellipse(250,200,100,100);

/*left eye ball*/
fill(150,0,0);
ellipse(150,200,50,50);

/*right eye ball*/

ellipse(250,200,50,50);

/*nose*/
rect(190,240,20,10);

/*mouth*/
triangle(140,260,260,260,200,310);

/*hat*/
triangle(70,150,330,150,200,80);
/*left acceserary*/
line(100,150,60,220);
ellipse(60,220,10,10);
/*right acceserary*/
line(300,150,330,220);
ellipse(330,220,10,10);
}

void draw( ) {
ellipse(150,200,50,50); /*left eye ball*/
ellipse(250,200,50,50); /*right eye ball*/

if (mousePressed){
 fill(150,0,0);
}
 else{
 fill(255);
  };
}
 
 








   
                                
