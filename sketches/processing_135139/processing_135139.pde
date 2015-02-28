
int aumenta = 0; 


void setup(){ 


  background(0,0,0); 
size(900,900); 
colorMode(HSB);

}
void draw() {

  noFill(); 
   stroke(random(255),random(250),255,50); 
ellipse(aumenta,height,aumenta,aumenta); 
aumenta+=15; 
  ellipse(width,aumenta,aumenta,aumenta);
 ellipse(width,height,aumenta,aumenta);
ellipse(aumenta,height,width-aumenta,height-aumenta);
ellipse(aumenta,height,width-aumenta,height);
ellipse(aumenta,height,width,height-aumenta);
ellipse(width,aumenta,width-aumenta,height-aumenta);
ellipse(width,aumenta,width-aumenta,aumenta);
ellipse(width,aumenta,aumenta,height-aumenta);
ellipse(width,height,width-aumenta,height-aumenta);
ellipse(width,height,width-aumenta,height);
ellipse(width,height,width,height-aumenta);
ellipse(width,height-aumenta,aumenta,aumenta); 
ellipse(width-aumenta,height,aumenta,aumenta); 
ellipse(width-aumenta,height-aumenta,aumenta,aumenta); 
ellipse(width-aumenta,height-aumenta,width,aumenta);
ellipse(width-aumenta,height-aumenta,aumenta,height);
ellipse(width-aumenta,height-aumenta,width,height);
}
