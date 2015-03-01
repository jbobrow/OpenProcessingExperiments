
PImage original;
PImage photoshopped;
 
void setup() {
size(500,300);
original = loadImage("https://33.media.tumblr.com/5fc42af01b8032d9c1e64ffee8240e96/tumblr_ncn4csq5Ur1qgkf30o1_500.jpg");
photoshopped= loadImage ("https://31.media.tumblr.com/79e853389d50dac8a898e508fdc0edca/tumblr_ncn45d8iuC1qgkf30o1_500.jpg");
}
void draw(){
if(mousePressed==true){
image(photoshopped,0,0);
}else{
image(original,0,0);
}
}

