
PImage original;
PImage retouched;
 
  
void setup() {
size(350,700);
original = loadImage("https://lh4.googleusercontent.com/-NF36UHcPr-8/VCg96iO2pTI/AAAAAAAAAD4/J1uUXYfKo8Q/w352-h529-no/DSC_1297.JPG");
retouched = loadImage("https://lh4.googleusercontent.com/-7kC4-88SIWY/VCg8uTshRlI/AAAAAAAAAEA/X0Dd-SqHZTE/w321-h529-no/gigiedit.jpg");
}
void draw(){
if(mousePressed==true){
image(retouched,0,0,350,700);
}else{
image(original,0,0,350,700);
}}
