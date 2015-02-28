
import processing.video.*;


import java.util.ArrayList;

import controlP5.*;

    private static final long serialVersionUID = -844350136455621718L;
    ArrayList<PVector> list;
    ControlP5 control;
    Button renderBtn;
    Slider red;
    Slider green;
    Slider blue;
    Slider dist;
    Slider rand;
    PGraphics buffer;
    PGraphics temp;

    public void setup()
    {
	size(1000, 500);
	frameRate(60);
	list = new ArrayList<PVector>();
	background(0);
	makeGUI();
	buffer = createGraphics(1000, 425, P2D);
	temp = createGraphics(1000, 425, P2D);
    }

    private void makeGUI()
    {
	CColor style = new CColor(color(191), color(121), color(191, 191, 220),
		color(100, 100, 120), color(100, 100, 120));
	CColor styleBright = new CColor(color(146, 198, 230), color(53, 150,
		208), color(220), color(0), color(0));
	control = new ControlP5(this);

	renderBtn = new Button(control, "Clear");
	renderBtn.setPosition(900, 440);
	renderBtn.setSize(90, 50);
	renderBtn.setColor(styleBright);
	renderBtn.addListener(new ControlListener()
	{

	   
	    public void controlEvent(ControlEvent e)
	    {
		buffer.beginDraw();
		buffer.background(0);
		buffer.endDraw();
		list = new ArrayList<PVector>();
	    }

	});

	red = new Slider(control, "Red");
	red.setPosition(10, 430);
	red.setSize(255, 25);
	red.setRange(0, 255);
	red.setColor(new CColor(style).setActive(color(200, 100, 100)));

	green = new Slider(control, "Green");
	green.setPosition(10, 465);
	green.setSize(255, 25);
	green.setRange(0, 255);
	green.setColor(new CColor(style).setActive(color(100, 200, 100)));

	blue = new Slider(control, "Blue");
	blue.setPosition(300, 430);
	blue.setSize(255, 25);
	blue.setRange(0, 255);
	blue.setColor(new CColor(style).setActive(color(100, 100, 200)));

	rand = new Slider(control, "Randomness");
	rand.setPosition(300, 465);
	rand.setSize(255, 25);
	rand.setRange(0, 1);
	rand.setColor(style);

	dist = new Slider(control, "Distance");
	dist.setPosition(600, 430);
	dist.setSize(255, 25);
	dist.setRange(0, 200);
	dist.setValue(50);
	dist.setColor(style);
    }

    public void draw()
    {
	background(0);
	noStroke();
	int fac = 20;
	for (int i = 0; i < fac; i++)
	{
	    int rectWidth = 255 / fac;
	    fill(getColor());
	    rect(625 + (i * rectWidth), 465, rectWidth, 25);
	}
	temp.beginDraw();
	temp.image(buffer, 0, 0);
	//contrastPixels();
	image(temp, 0, 0);
	temp.background(0);
	temp.endDraw();
	if (mousePressed && mouseY < 425)
	    step();
    }

    int getColor()
    {
	float fac = rand.getValue();
	float r = red.getValue() + (random(fac) - fac / 2) * 510;
	float g = green.getValue() + (random(fac) - fac / 2) * 510;
	float b = blue.getValue() + (random(fac) - fac / 2) * 510;
	return color(r, g, b, 20);
    }

    private void step()
    {
	temp.beginDraw();
	temp.smooth();
	temp.noStroke();

	// int x = (int) (random(1) * buffer.width);
	// int y = (int) (random(1) * buffer.height);
	int x = mouseX;
	int y = mouseY;
	temp.fill(255, 255, 255, 20);
	// buffer.ellipse(x, y, 50, 50);

	temp.strokeCap(ROUND);
	temp.strokeWeight(1);

	temp.stroke(color(getColor()));

	PVector pos;
	for (int i = 0; i < list.size(); i++)
	{
	    pos = list.get(i);
	    if (pos.dist(new PVector(x, y)) < dist.getValue())
		temp.line(x, y, pos.x, pos.y);
	}
	list.add(new PVector(x, y));
	if (list.size() > 10000)
	    list.remove(0);
	temp.endDraw();
	flushTemp();
    }

    private void flushTemp()
    {
	buffer.loadPixels();
	temp.loadPixels();
	for (int i = 0; i < temp.pixels.length; i++)
	{
	    int col = temp.pixels[i];
	    int col2 = buffer.pixels[i];
	    float r = (red(col) + red(col2));
	    float g = (green(col) + green(col2));
	    float b = (blue(col) + blue(col2));
	    if (r > 255)
		r = 255;
	    if (r < 0)
		r = 0;
	    if (g > 255)
		g = 255;
	    if (g < 0)
		g = 0;
	    if (b > 255)
		b = 255;
	    if (b < 0)
		b = 0;
	    int sum = color(r, g, b);

	    buffer.pixels[i] = sum;
	}
    }




