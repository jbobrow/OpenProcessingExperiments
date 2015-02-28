
size(300,300);
// color reference https://kuler.adobe.com/Bloggy-Gradient-Blues-color-theme-66891/edit/?copy=true&base=4&rule=Custom&selected=4&name=Copy%20of%20Bloggy%20Gradient%20Blues&mode=rgb&rgbvalues=0.8823529411764706,0.9019607843137255,0.9803921568627451,0.7686274509803922,0.8431372549019608,0.9294117647058824,0.6705882352941176,0.7843137254901961,0.8862745098039215,0.21568627450980393,0.36470588235294116,0.5058823529411764,0.09411764705882353,0.19215686274509805,0.3215686274509804&swatchOrder=0,1,2,3,4
background(196,215,237);

// variables
float x = 150;
float y = 150;
float diameter = 100;

//lines
stroke(55,93,129);
strokeWeight(2);
line(0,0,width,height);
line(0,0,width * 0.5,height);
line(0,0,width * 0.25,height);
line(0,0,width * 0.125,height);
line(0,0,width / 0.5,height);
line(0,0,width / 0.25,height);
line(0,0,width / 0.125,height);

//center circle
noStroke();
fill(24,49,82);
ellipse( x, y, diameter + 100, diameter + 100);
fill(55,93,129);
ellipse( x, y, diameter + 100/2, diameter + 100/2);
//ellipse( x, y, diameter, diameter);
//ellipse( x, y, diameter/2, diameter/2);
rect(width / 2 - 75, height / 2 - 75, 150 / 2, 150 / 2);
fill(171,200,226);
rect(width / 2 - 50,height / 2 - 50,100,100);
fill(255,230,250);
rect(width / 2 - 25,height / 2 - 25,50,50);

// white circle
x = x + 100;
y = y + 100;
diameter = diameter +100;
ellipse(x,y,diameter,diameter);
fill(200);
ellipse(x,y,diameter / 2 + 50, diameter / 2 + 50);
fill(150);
ellipse(x,y,diameter / 2, diameter / 2);


