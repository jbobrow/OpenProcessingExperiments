
int w = 20; //width
int h = 10; //height

int startX = 0; //x-position
int startY = 0; //y-position


size(400,400);

//adapted from processing archive

colorMode (HSB, 205);
float hue, sat, bright, alpha; //declare hue
hue = 250;
saturation = 200;
brightness = 100;
alpha = 100;

stroke(200,48,86);



for(int j = startY; j<=height; j=j+h){ 
  for( int i = startX; i<=width; i=i+w/3){ //inner loop
    hue = random(100,200); //random(range of hues)
    alpha = random(0,100); //
    
    
    //step 1: generate a random number between 0-10
    float tenPercent = random(3);
    
    //step 2: check if the number is less than 1
    if( tenPercent <=1 || tenPercent >=9){ // or is denoted by "||". And is &&, == is equivalence
      //step 3: if it is, set the fill
      fill(109,27,242,150); //
      println(); 
    }
    else{
      //step 4
      fill(hue, 100,150, alpha );
      stroke(307,100,100,100);
    }
    
    ellipse(i, j, w, h);
    println("i: " + i); // show i: and value of i
  }
}


