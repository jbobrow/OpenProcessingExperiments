
//barchart
color [] palette = {#39555c,#e8daa6,#ffb688,#c98161,#8a4c3a};

String[] flavor = {"choc","FOD","Van","T"};
int[] mostSold ={126,187,187,500};
String[] fullName = {"Chocolate","Flavor of the Day","Vanilla","Total Sold"};

//setup////////////////////////////////////////////////////////
void setup(){
  size(600,550);
  smooth();
  rectMode(CENTER);
}//end setup




//draw/////////////////////////////////////////////////////////
void draw(){
  background(palette[0]);
  noStroke();
  int b = 20;
  int l = 35;
  
  for( int i = 0; i< flavor.length; i++){
    int w = 50;
    int s =80;
    int[] t = new int[flavor.length];
    t[i] = mostSold[i];
    int [] x= new int[flavor.length];
    x[i] = int(1+(i+.5)*(w+s));
    int [] y = new int[flavor.length];
    y[i] = height-b-t[i]/2;
  
  if((mouseX>(x[i]-w/2)) && (mouseX<(x[i]+w/2)) &&
  (mouseY>(y[i]/2)) && (mouseY<(y[i]+w/2))){
    fill(palette[2]);
    
    text(fullName[i] + ": " + mostSold[i], x[i],y[i]-t[i]/2-10);
  }else{
    fill(palette[1]);
    }
     rect(x[i],y[i],w,t[i]);
  }//end for loop
//  rect(x[i],y[i],w,t[i]);

}//end draw

