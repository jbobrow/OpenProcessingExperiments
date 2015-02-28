
size(1000,1000);
    colorMode(HSB,360,100,100,100);

}
  void draw(){
     String[] data= loadStrings("population.csv");
    println(data [24000]);
    

  for(int i= 0; i<24951 ; i++){
      String [] pieces = split (data[i],",");
    
  float gender= parseFloat (pieces[2]);
  float age = parseFloat (pieces[3]);
  float pop = parseFloat(pieces[4]);
  
gender =map(gender,0,1,width,height);

  stroke(5);
line (age,pop,age,pop);
fill(269,30,68);
ellipse(pop, pop, 30,30);
rect(gender,age,530,530);
  }
  

  
}
