
int counter;
int ok=0;
int x=0;
int y=0;
int iii=0;
int[] lastrowH= new int[999];
int[][] image = new int[666][666];

void setup() {  //setup function called initially, only once
  size(666, 666);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
  for(int k=0; k<666; k+=1;){ lastrowH[k]=random(255); }
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  x=0;
  while(x<666){
    int v=((lastrowH[x]+lastrowH[x+1]+lastrowH[x+2]+lastrowH[x+3]+lastrowH[x+4]+random(64))/5.25)%5;
    lastrowH[x]=v;
    image[x][y]=v;
    if( iii==0 ){
      fill(v,0,0,128); }
    if( iii==1 ){
      fill(0,v,0,128); }
    if( iii==2 ){
      fill(0,0,v,128); }
  
    rect(x, y, 1, 1);
    x+=1;
  }
  y+=1;
  if( y>666){ 
    y=0; 
    x=0;
    iii+=1;
    if( iii>2 ){ iii=0; }
  }
}
