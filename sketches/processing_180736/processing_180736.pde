
int w = 20; //width
int h = 20; //height

int startX = 0; //x-position
int startY = w/2; //y-position


size(400,400);


// code from processing archive

noStroke();

colorMode (RGB, 50);
float hue, sat, bright, alpha; // Declare hue of type float
hue = 100;
alpha = 125;



for(int j = startY; j<=height; j=j+h/2){ 
  for( int i = startX; i<=width; i=i+w/2 ){ //inner loop
    hue = random(110,140); //hue range
    alpha = random(30,155);
    
    //make 10% of circles black
    //step 1: generate number 0-10
    float tenPercent = random(10);
    
    //step 2: check if the number is less than 1 make it pink
    if( tenPercent <=1 || tenPercent >=9){ 
      fill(255,0,255, 145); //hot pink RGB, opacity
      stroke(204, 102, 0);
      

    }
    else{
      //step 4: if not make blue
      fill(hue, 200, 255, alpha );
       stroke(255, 15, 145);
    }
    
    ellipse(i, j, w, h);
    println("i: " + i); // show i: and value of i
  }
}




