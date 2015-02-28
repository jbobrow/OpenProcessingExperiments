
int num = 5000;
int range = 100;
color cp;

PImage myImage;
PImage img;

float[] ax = new float[num];
float[] ay = new float[num];

String tableau[] = {"Arbre.jpg"};
String tableau1[] = {"Arbre1.jpg"};

void setup()
{
size(400,400);
for(int i = 0; i < num; i++) {
ax[i] = width/400;
ay[i] = height/400;
}
frameRate(200);
myImage = loadImage(tableau[0]);

myImage.resize(width, height);

}

void draw()
{
background(255);


// Shift all elements 1 place to the left
for(int i = 1; i < num; i++) {
ax[i-1] = ax[i];
ay[i-1] = ay[i];
}

// Put a new value at the end of the array
ax[num-1] += random(-range, range);
ay[num-1] += random(-range, range);

// Constrain all points to the screen
ax[num-1] = constrain(ax[num-1], 0, width);
ay[num-1] = constrain(ay[num-1], 0, height);


//cp = myImage.get((int)ax[num-1],(int)ay[num-1] );
//println(cp);

// Draw a line connecting the points
for(int i=1; i<num; i++) {
float val = float(i)/num * 204.0 + 51;
//stroke(val);
cp = myImage.get((int)ax[i-1],(int)ay[i-1] );
stroke(cp, 200);
strokeWeight(5);
smooth();
line(ax[i-1], ay[i-1], ax[i], ay[i]);


}
img = loadImage(tableau1[0]);
image(img, 300,300);
img.resize (200,200);
}

