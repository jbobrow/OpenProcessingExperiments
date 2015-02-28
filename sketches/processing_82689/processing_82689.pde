
/* @pjs preload="caitulo7.txt"; */ 

byte cap7[];
int txtWidth = 75;
int incX = 8;
int incY = 35;
int sz;
int x = 0;
int y = 0;
int c = 0;
int txtHeight;
 

//.-----------------------------------------------
void setup(){
    frameRate(12);
    cap7 = loadBytes("capitulo7.txt");
    sz = cap7.length;
    txtHeight = sz/txtWidth;
    //println(txtWidth*incX+100);
    //println(txtHeight*incY+100);
    //size(txtWidth*incX+100, txtHeight*incY+100);
    size(700, 765);
    println("Hay " + sz + " en capitulo 7");
}


//.-----------------------------------------------
void draw(){

    fill(80*sin(0.02*frameCount)+120,
    64*cos(0.005*frameCount)+100,
    64*sin(0.0025*frameCount + (PI/4))+64,
    50*sin(0.001*frameCount)+50);
    
    rect(0,0,txtWidth*incX+100, txtHeight*incY+100);


    for(int i = 0; i < txtHeight ; i++){
      for(int j = 0; j < txtWidth; j++){
          x = j * incX + 50;
          y = i * incY + 50;
/*          fill(cap7[(i+j*i+c)%sz], 
               cap7[(i+j*i+1+c)%sz], 
               cap7[(i+j*i+2+c)%sz], 
               cap7[(i+j*i+3+c)%sz]);*/
          
          fill(cap7[(i+(j*i)+c) % sz],      
//          fill(cap7[(i+(j*i)+(int)(128*sin(0.00002*frameCount)+127)) % sz], 
               0, 
               0, 
               cap7[(i+(j*i)+(int)(100*sin(0.02*frameCount)+100))%sz]);
     
          stroke(cap7[(i+(j*i)+(int)(15*sin(0.02*frameCount)+15))%sz],
          cap7[(i+(j*i)+(int)(15*sin(0.04*frameCount)+15))%sz],
          cap7[(i+(j*i)+(int)(15*sin(0.06*frameCount)+15))%sz],
          cap7[(i+(j*i)+(int)(15*sin(0.02*frameCount)+15))%sz]);
          rect(x,y,incX, incY);
       
  
        }
       }      
 c = (c + 1) % sz;
}

