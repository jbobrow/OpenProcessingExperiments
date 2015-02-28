
 
  String [] data_in = loadStrings ("data.csv"); 


String[] age = {
"18:",
"20:",
"21:",
"23:",
"28:",
"62:",
"63:",
"67:",
"68:",
"72:",
"74:",
"76:",
"80:",
"87:",
"89:",
};
 
int[] population = {
9  ,
61  ,
30   ,
60   ,
29,
30   ,
27,
19  ,
15  ,
14   ,
32, 
9,
12,
12,
4,
3,
};
 
 
void setup(){
  size(600,400);
  background(0,0,0);

}
 
void draw(){
  int x=0;
   for(int i=0;i<15;i++){
     

      
    
    float h = map(population[i], 0,71,0,400);
     
    rect(x+4,height-h,32,h);
    x+=40;
    if(mouseX>x && mouseX<=x+40){
       fill(0,0,255);
     }else{
       fill(238,0,0);
     }
  }
 
}


