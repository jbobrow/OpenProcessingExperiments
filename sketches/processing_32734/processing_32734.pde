
float [] x=new float [3000];

  void setup(){
    size(1000,900);
    smooth();
    noStroke();
    fill(255,255,0);
    for(int i =0; i< x.length; i++){
      x[i] =random(-1000,200);
    }

}
  
  void draw(){
    //background(0);
    for(int i=0; i< x.length; i++){
    x[i] += 0.9;
      float y = i*15.0;
    arc(x[i], y, 5, 12, 0.52, 5.76);
    
    }
  //save ("warpspeedpacmen.jpg");
}
  

