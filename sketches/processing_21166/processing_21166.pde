
PImage mapImage;
int[] data;

void setup(){
  mapImage = loadImage("mapmap.png");
  size(mapImage.width, mapImage.height);
  String[] population = loadStrings("data.txt");
  data = int(split(population[0], ',' ));
  
}

void draw(){
  image(mapImage,0,0);
  circlesOne(data);
  circlesTwo(data);
}

void circlesOne(int[] nums){
  smooth();
  fill(30,255,255);
  noStroke();
  for(int i = 0; i < 1; i++){
    //ellipse(i*20,400,20,-nums[i]/1000);
    //fill(random(0,255),random(0,255),random(0,255));
    ellipse(165,90,-nums[i]/10000,-nums[i]/10000);
  }
}

void circlesTwo(int[] nums){
  smooth();
  fill(100,255,5);
  noStroke();
  for(int i = 7; i < 8; i++){
    //ellipse(i*20,400,20,-nums[i]/1000);
    //fill(random(0,255),random(0,255),random(0,255));
    ellipse(135,230,-nums[i]/10000,-nums[i]/10000);
  }

 
}


