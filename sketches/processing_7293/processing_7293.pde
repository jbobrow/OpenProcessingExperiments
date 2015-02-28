
color colors[][] = new color [801][801]; 

color col[] = new color [1000001]; 

float x[] = new float [1000001]; 

float y[] = new float [1000001]; 

float xm[] = new float [1000001]; //s for start

float ym[] = new float [1000001]; 

PImage logo;

int sum = 1;

int firstime = 1;

color bg = 240;

void setup(){

  size(800,800,JAVA2D);
  frameRate(3000);

  logo = loadImage("logo.png");
  image(logo, 0, 0);
    
  for(int i=1; i<=width-10;i++){
    for(int j=1; j<=height-10;j++){
      colors[i][j] = get(i,j);
      if (blue(colors[i][j]) < 255 && (random(0,1) > 0.97)) { 
        x[sum] = i; y[sum] = j;
        
        col[sum] = colors[i][j];
        println(sum++);
      }
         
    }
  }


    for(int i=1; i<=50;i++){

      int a = int(random(1,sum));
      xm[i] = x[a];
      ym[i] = y[a];
      
    }
    
    
    
  
  

background(bg);

}

void draw(){
int ball_size = 60;
  for(int i=1; i<=sum;i++){ 
   
    stroke(col[i],10);
    point(x[i],y[i]);
    if (dist(mouseX,mouseY,x[i],y[i])<ball_size/2+10 || firstime == 1){
    for(int ii=i; ii<=sum;ii++){
      if (dist(x[i],y[i],x[ii],y[ii])<30){  
        stroke((red(col[i])+red(col[ii]))/2,(green(col[i])+green(col[ii]))/2,(blue(col[i])+blue(col[ii]))/2,13); 
        line(x[i],y[i],x[ii],y[ii]);
        
      }
      
        if (dist(mouseX,mouseY,x[i],y[i])<ball_size/2){
        
          x[i] = x[i] + random(-2,2);
          y[i] = y[i] + random(-2,2);
          
        }
             
    }  
  
  }
  }
      noStroke();
          fill(bg);
          
          ellipse(mouseX,mouseY,ball_size,ball_size);

   firstime = 0;

}




