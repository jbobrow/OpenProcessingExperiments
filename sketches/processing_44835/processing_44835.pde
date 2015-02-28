
String[] name = {
"China:",
"India:",
"United States:",
"Indonesia:",
"Brazil:",
"Pakistan:",
"Bangladesh:",
"Nigeria:",
"Russia:",
"Japan:",
};

int[] population = {
1330044544	,
1147995904	,
303824640	,
237512352	,
196342592	,
172800048	,
153546896	,
146255312	,
140702096	,
127288416	,
};


void setup(){
  size(400,400);
}

void draw(){
  int x=0;
   for(int i=0;i<10;i++){
    
     if(mouseX>x && mouseX<=x+40){
       fill(255,40,40);
     }else{
       fill(50);
     }
     
    //we need to make the data range fit in out window so we can use map 
    // we take the upper bound as a little larger our biggest value
    // and the lower bound as a little lower than our lowest value
    float h = map(population[i], 120000000,1340000000,0,400);
    
    // as y increaces posativly from top to bottom we need to fiddle around
    // where the top of our box is to make it look like they grow from bottom to top
    rect(x+4,height-h,32,h);
    
    // after we have drawn a bar we need to incriment our x position so
    // they don't draw on top of each other
    x+=40;
  }

}

