



import java.awt.geom.Point2D;

import processing.core.PApplet;
import processing.core.PFont;

public class XmasCard extends PApplet {

	private int bodyX;
	private int bodyY;
	private int headX;
	private int headY;
	private int unitX;
	private int unitY;
	private snowFlake snowFlakes[];
	private int snowFlakeMaxCnt;
	private int snowFlakeCnt;
	private Star stars[];
	private int starCnt;
	private Point2D points[];
	
	private PFont fontBanner, fontIntro, fontMessage;
	private String textBanner, textIntro, textMessage;
	private int alpha, alphaIntro;

	private float xoff, yoff;
	/* public XmasCard(int _w, int _h) {

		w = _w;
		h = _h;	
	} */


	public void setup(){
		size(800,400);		
		background(0);
		frameRate(30);
		smooth();

		unitX = width/12;
		unitY = height/6;

		snowFlakeMaxCnt = 50;
		snowFlakes = new snowFlake[snowFlakeMaxCnt];

		for(int i=0 ; i < snowFlakeMaxCnt; i++ ) 
			snowFlakes[i] = new snowFlake(width, height);

		snowFlakeCnt = 0;
		cursor(CROSS);

		starCnt = 13;
		stars = new Star[starCnt];
		xoff = yoff = 0.0f;

		for(int i=0; i < starCnt; i++) {
			xoff += 10;
			yoff += 10;
			stars[i] = new Star(unitX*(i),unitY/2, unitX/5);

		}


		fontBanner = createFont("Arial Rounded MT Bold",40);
		textBanner = "Happy Holiday!";
		fontIntro = createFont("Bodoni MT Bold Italic", 25);
		textIntro = "I let you snow.... Click the screen at least 10times...";
		fontMessage = createFont("Blackadder ITC", 24);
		textMessage = "Dear my friend,\n" +
		"Thank you very much for being a part of my life.\n" +
		"My relationship with you is a precious gift in my life...\n" +
		"Love, Kyoko\n";
	
		alpha = 50;
		alphaIntro = 255;

	}

	public void draw() {

		background(0);	

		// draw snowflakes, no matter what...
		for(int i=0 ; i < snowFlakes.length; i++) {
			noStroke();
			fill(255,255,255,200);
			snowFlakes[i].fade(i); 
			snowFlakes[i].falling();
			fill(snowFlakes[i].getAlpha());
			ellipse((float)snowFlakes[i].getPosition().getX(), (float)snowFlakes[i].getPosition().getY(),5,5);
		}


		if (50 < snowFlakeCnt) snowFlakeCnt=0;

		
		// wait to draw until 5 snow flakes come out
		if(0 <= snowFlakeCnt && snowFlakeCnt < 10) {
			if( snowFlakeCnt != 0 ) 
			alphaIntro -= 5;
			
			fill(200,200,0, alphaIntro);
			textFont(fontIntro);
			text(textIntro, width/2-textIntro.length()*5, height/2);
			
		}
		else {

			if(alpha < 255)
				alpha += 10;
			else
				alpha = 255;

			// size of body and head of a snowman
			bodyX = unitX*3;
			bodyY = unitY*3;
			headX = unitX*2;
			headY = unitY*2;

			fill(225,255,255,alpha);
			noStroke();

			pushMatrix();
			
			translate(width/4,height/2+unitY);
			scale(0.8f,0.8f);
			
			// a body for the snowman
			ellipse(0, 0, bodyX, bodyY);
			ellipse(0,-(bodyY/2+headY/2), headX, headY);

			// eyes for the snowman
			fill(0,0,0,alpha);
			ellipse(headX/4, -(bodyY/2+headY/2), 10,10);
			ellipse(-headX/4, -(bodyY/2+headY/2), 10,10);

			// a smily mouth for the snowman
			noFill();
			stroke(200,0,0,alpha);
			arc(0,-(bodyY/2+headY/2-unitY/4),30,30, 0, PI);
			
			popMatrix();

			// show the message
			fill(200,0,50,alpha);
			textFont(fontBanner);
			text(textBanner, width/2-unitX, height/3);
			fill(0,200,50,alpha);
			textFont(fontMessage);
			text(textMessage, width/2-unitX, height/2);
			
			fill(200,200,0,alpha);
			noStroke();
			for(int i=0 ; i < starCnt ; i++ ) {
				points = stars[i].getPoints();
				beginShape();
				vertex((float)points[0].getX(), (float)points[0].getY());
				vertex((float)points[2].getX(), (float)points[2].getY());
				vertex((float)points[4].getX(), (float)points[4].getY());
				vertex((float)points[1].getX(), (float)points[1].getY());
				vertex((float)points[3].getX(), (float)points[3].getY());
				endShape(CLOSE);
			} 	
			
		}
		
	}

	public void mousePressed() {
		snowFlakes[snowFlakeCnt++].putPosition(mouseX, mouseY);	
	}

	
	static public void main(String args[]) {
	    PApplet.main(new String[] { "xMas.XmasCard" });
	  } 
}

