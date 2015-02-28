
//////////////////////////////////////////////////////
// Exercise 041 - remove birds
//  Leonardo Covarrubias
//
//
//////////////////////////////////////////////////////

PImage birds;
PImage original;

int thresh;

original = loadImage("birds.jpg");
original.loadPixels();
birds = loadImage("birds.jpg");
birds.loadPixels();
thresh = 1;
size(birds.width, birds.height*2);

int W = birds.width;
int H = birds.height;


color RED = color(255,0,0);

/////////////////////////
//initial bird detection/
/////////////////////////

thresh = 43;  //initial bird pixel threshold

for(int y=0; y < H; y++){
  int ycol = (y*W);
  for(int x = 0; x < W; x++){
    int index = ycol+x;

    color c = birds.pixels[index];

    float r = red(c);
    float g = green(c);
    float b = blue(c);

    if( (r<thresh) && (g<thresh) && (b<thresh)){
      birds.pixels[index] = RED; //Turn detected Red
    }//end for thresh


  }//end for X
}//end for Y



////////////////////
//Grow bird region//
////////////////////

int growTimes = 5;

for(int count = 1; count<=growTimes; count++){

  /////////////////////////////////////
  //create binary bird detection image/
  /////////////////////////////////////

  int[] binArray = new int[H * W];

  for(int i = 0; i < binArray.length; i++){
    if(birds.pixels[i] == RED){
      binArray[i] = 1;
    }
    else{
      binArray[i] = 0;
    }
  }//end create binary bird Image

  /////////////////////////
  //grow RED pixel region//
  /////////////////////////

  for(int y=0; y < H-1; y++){
    int ycol = (y*W);
    for(int x = 0; x < W-1; x++){
      int a = ycol+x;
      int b = (y*W) + (x-1);
      int c = ((y+1)*W) + x;
      int d = ((y-1)*W) + x;
      int e = (y*W) + (x+1);
      int f = ((y-1)*W) + (x-1);
      int g = ((y-1)*W) + (x+1);
      int h = ((y+1)*W) + (x-1);
      int i = ((y+1)*W) + (x+1);

      if(binArray[a] == 1){

        birds.pixels[b] = RED;
        birds.pixels[c] = RED;
        birds.pixels[d] = RED;
        birds.pixels[e] = RED;
        //birds.pixels[f] = RED;
        //birds.pixels[g] = RED;
        //birds.pixels[h] = RED;
        //birds.pixels[i] = RED;


      }


    }//end for X
  }//end for Y
}//end grow times

/////////////
//Fix image//
/////////////

//////////////////
//Blending Style//
//////////////////

///*

color blended;

for(int index = 0; index < (W*H); index++){
  if(birds.pixels[index] == RED){

    color a = birds.pixels[index-1];
    
    int counter = 0;
    while(birds.pixels[index+counter] == RED){
      counter++;
    }
    color b = birds.pixels[index+counter];
    
    blended = color( (red(a)+red(b))/2,
    (green(a)+green(b))/2,
    (blue(a)+blue(b))/2 );

    birds.pixels[index] = blended;                 

  }
}

//*/

/*

//////////////////
//Gradient Style//
//////////////////


color grad;

for(int index = 0; index < (W*H); index++){
  if(birds.pixels[index] == RED){

    color a = birds.pixels[index-1];
    
    int counter = 0;
    while(birds.pixels[index+counter] == RED){
      counter++;
    }
    
    color b = birds.pixels[index+counter];
    
    int numInRow = counter;
    counter = 0;
    int divisor;
    int numeratorA;
    int numeratorB;
    
    while(birds.pixels[index+counter] == RED){
    
      divisor = numInRow+1;
      numeratorA = numInRow - (counter+1);
      numeratorB = counter + 1;
      
      //grad = color ( abs( red(a) + ( red(b)*( ( numInRow-1)/(counter+1) ) ) ),                     abs( green(a) + ( green(b)*( (numInRow-1)/(counter+1) ) ) ),                     abs( blue(a) + ( blue(b)*( (numInRow-1)/(counter+1) ) ) ) );
      grad = color ( abs( red(a) * (numeratorA/divisor) ) + abs( red(b) * (numeratorB/divisor) ),
                     abs( green(a) * (numeratorA/divisor) ) + abs( green(b) * (numeratorB/divisor) ),
                     abs( blue(a) * (numeratorA/divisor) ) + abs( blue(b) * (numeratorB/divisor) ) );
      birds.pixels[index+counter] = grad;
      
      counter++;
    }
                   

  }
}

*/

/////////////////////////////////////
//Display original and fixed images//
/////////////////////////////////////

birds.updatePixels();
image (birds,0,H);
original.updatePixels();
image (original,0,0);

