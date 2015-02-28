



float[] numbers;
String[] names;
float theta;

PFont f;

float by;

void setup(){
  size(1200,700);
  smooth();
  f=loadFont("ArialMT-16.vlw");
  String[]lines=loadStrings("dataObe.txt"); // People has 13 elements
  numbers = new float[lines.length];   // Data has 13 elements
  names = new String[lines.length];
  
  for (int i = 0; i < lines.length; i++) {
    String[] splitting = split(lines[i],","); // splitting only has 2 elements
    names[i] = splitting[0];
    numbers[i] = float(splitting[1]);

    println(splitting[1] + " " + splitting[0]);
  }
  
  
}

void draw(){
  background(255);
 translate(0,130);
  number();
  //nameM();
}


void number(){
  
  for(int i=0; i<numbers.length; i++ ){
    fill(0);
    
    float vpeople = map(numbers[i],130000,5800000,0,450);
    float a=33+i*90;
    //float b=a*3/5+10;
   // float b=a/2;
    float c=9;
    float d=620; 
    //rotate(PI/200);
    float ym=map(sin(theta),-1,1,10,vpeople);
    float big=map(sin(theta),-1,1,vpeople/10,1);

    
    text(names[i],a,vpeople,9,600);
    text(names[i], a,ym,600,20 );
    
   
    //rect(a-5,ym,8,8);
   
     noStroke();
     fill(0,100);
     ellipse(a-5,ym,big,big);
     fill(0);
     rect(a-5,10,ym/10,ym/10);
     stroke(0);
     line(a-5,10,a-5,ym);
     //line(a,0,a+1,0);
    


//    for( int j=0;j<=vpeople;j++){
//      stroke(random(0,255));
//      line(i*100,height/2+j,100*(i-1),height/2+j);
     
    }
    
  
  
  theta+=0.005;
}




  

