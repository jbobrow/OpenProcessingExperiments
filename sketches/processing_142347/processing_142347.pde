
size(600,600);
background(255);

int a;
int b;
a= width/2;
b= height/2;


fill(0); arc(a, height/4, width/1.4,height/1.9, 0,PI, CHORD);// cues

fill(0); ellipse(a-width/31,height-height/8.5, width/17, height/22);
fill(255); stroke(0); strokeWeight(8); rect(a-width/150,height-height/4, -width/20, height/8); //cama i sabat dretes
fill(0); ellipse(a+width/31,height- height/8.25, width/19, height/22);
fill(255); stroke(0); strokeWeight(8); rect(a+width/150,height-height/4, width/20, height/8); //cama i sabat esuqerres

stroke(0); strokeWeight(6); fill(255,200,150); ellipseMode(CORNERS); ellipse(a,b,width-width/2.6, height-height/4); //BRAÇ ESQUERRE
stroke(0); strokeWeight(6); fill(255,200,150); ellipseMode(CORNERS); ellipse(a,b, width/2.6, height-height/4); //BRAÇ DRET

ellipseMode(CENTER);
stroke(0); strokeWeight(8); fill(50,150,30); quad(a-width/15,b, a+width/15,b,a+width/10,b+height/4, a- width/10, b+height/4); //vestit
stroke(0); strokeWeight(1); fill(0); quad(a-width/14, b+b/8, a+width/14,b+b/8,a+width/12, b+b/4, a- width/12,b+b/4); // franja negre al mig del vestit 

stroke(0); strokeWeight(4); fill(255,200,150); ellipse(a , height/3.2, width/1.75, height/2.4); //cara

stroke(0); strokeWeight(1); fill(255); ellipse(width/3, height/3,width/4.75, height/4.75);
stroke(120,200,250); fill(50,150,30); ellipse(width/2.95, height/3,width/5.75, height/6);
stroke(0); fill(0); ellipse(width/2.85, height/3,width/8, height/8);
stroke(255); fill(255); ellipse(width/2.85, height/3,width/16, height/16); // primer ull

stroke(0); strokeWeight(1); fill(255); ellipse(width/1.5, height/3,width/4.75, height/4.75);
stroke(120,200,250); fill(50,150,30); ellipse(width/1.52, height/3,width/5.75, height/6);
stroke(0); fill(0); ellipse(width/1.57, height/3,width/8, height/8);
stroke(255); fill(255); ellipse(width/1.59, height/3,width/16, height/16); // segon ull 

stroke(0); strokeWeight(2); line(a-width/30, b-height/12, a-width/30, b-height/10); 
stroke(0); noFill(); strokeWeight(2); arc(a, b-height/12, 2*width/30,height/15,0,PI); //boca
stroke(0); strokeWeight(2); line(a+width/30, b-height/12, a+width/30,b-height/10);

fill(0); ellipseMode(CENTER); arc(a , height/4, width/1.75, height/2.9, PI, TWO_PI,OPEN); 
stroke(255,200,150); fill(255,200,150); triangle(a-width/15,height/4, a,height/6,a+width/15,height/4);  //serrell





