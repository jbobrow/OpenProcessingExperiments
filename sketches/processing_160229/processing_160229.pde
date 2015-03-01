
//Intro to Arrays 
//float age = 40.5;
int x = 600;
int y = 600;
//String name = "Taylor";
//println (age);
//println (x);
//println (y);
//println (name);
//println ("My name is " + name);
//String [] fruitName = {"apple", "banana", "grape", "strawberry"};
//String [] fruitName = new String fruitName[4];
//prinkln(fruitName);
//println(fruitName); 
//println(fruitName[1]);
//println(fruitName[0]);
//println(fruitName[3]);
//println(fruitName[2]);
//println(fruitName[0]);
//println(fruitName[3]);

size(x,y);
background(255);
int n = 1000;
float[] xTop = new float[n];
float[] xBottom = new float[n];

int i = 0;
while (i < 600) {
  stroke(147, 20, 200);
  line(0, i, 600, i);
  i = i + 7;
} 
for (int l = 0; l < n; l++ ){
  xTop[l] = random(0, 600);
  xBottom[l] = random(0, 600);
  strokeWeight(1);
  stroke(random(0, 147), random(0, 169), random(0, 1175), 90);
  //stroke(100, 150, random(0, 1175), random(0, 160), 10);
  line(xTop[l], 600, xBottom[l], 600);
}


