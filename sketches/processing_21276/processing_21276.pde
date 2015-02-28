
int[][] a,b, auxa, auxb;
int timer, asum, bsum;
boolean swap = true;
PImage img;

void setup() {
  background(0);
  fill(0,10);
  timer=0;

  frameRate(180);
  size(200,200,P2D);
  
  img = createImage(width+2, width+2, ARGB);

  a = new int[width+2][height+2];
  for(int i=0;i<width+1;i++)
    for(int j=0;j<height+1;j++)
      a[i][j]=0;

  b = new int[width+2][height+2];
  for(int i=0;i<width+1;i++)
    for(int j=0;j<height+1;j++)
      b[i][j]=0;

  auxa = new int[width+2][height+2];
  auxb = new int[width+2][height+2];
}

void draw() {
  timer++;
  ////////////random
  if(timer<10){
    for(int i = 1;i<width;i++){a[i][0]=int(random(2));b[i][height]=int(random(2));}//top vs down
    //for(int j = 1;j<height;j++){a[0][j]=int(random(2));b[width][j]=int(random(2));}//left vs right
  }
  
  if(timer%1000==0)swap = !swap;
  
  for(int i=1;i<width;i++){
    for(int j=1;j<height;j++){
      //evolve a      
      rules(a,auxa,i,j);
      //evolve b          
      rules(b,auxb,i,j);

      //fight       
      if(auxa[i][j]==1&&auxb[i][j]==1){
        //////////////////////////////////////////////////////////////////////////fighting rules:
        //if(random(height)>j+((height/3)*sin(timer/200))) //moving border
        //if(random(height)<j) //swap u/d
        //if(random(width)<i) //swap l/r
        //if((int)random(2)==0) //equal fight.
        
        if((swap&&random(height)<j)||(!swap&&random(height)>j))
        {
          auxa[i][j]=1;auxb[i][j]=0;
        }
        else
        {
          auxa[i][j]=0;auxb[i][j]=1;
        }
      }
    }
  }

  rect(-1,-1,width+1, height+1);
  for(int i=0;i<width+1;i++){
    for(int j=0;j<height+1;j++){
      a[i][j]=auxa[i][j];
      b[i][j]=auxb[i][j];
      img.pixels[j*(width+2)+i] = #CC6600*a[i][j]+#006699*b[i][j];
    }
  }      
  img.updatePixels();
  image(img,-1,-1);
}

static void rules(int[][] x, int[][] aux,int i, int j){
      int t = 0;
      t += x[i-1][j-1];
      t += x[i][j-1];
      t += x[i+1][j-1];
      t += x[i-1][j];
      t += x[i+1][j];
      t += x[i-1][j+1];
      t += x[i][j+1];
      t += x[i+1][j+1];
      
      //if(x[i][j]==1){if(t<1||t>3)aux[i][j]=0;}else{if(t==3)aux[i][j]=1;}//GOD
      //if(x[i][j]==1){if(t<2||t>3)aux[i][j]=0;}else{if(t==3)aux[i][j]=1;}//GOL - blijven randomizen!
      if(x[i][j]==1){if(t<2||t>4)aux[i][j]=0;}else{if(t==3)aux[i][j]=1;}//thundermaze
}               
