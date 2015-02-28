
import processing.core.*; 

import java.util.ArrayList; 

public class AspektWorld extends PApplet {
	public static final int BIG_STROKE = 5;
	public static final int MIDDLE_STROKE = 3;
	public static final int SMALL_STROKE = 3;
	private static final long serialVersionUID = 61803L;
	public final static int FORWARD = 1;
	public final static int BACKWARD = 2;
	public final static int RIGHTWARD = 4;
	public final static int LEFTWARD = 8;
	public final static int UPWARD = 16;
	public final static int DOWNWARD = 32;
	static public void main(String args[]) {
		PApplet.main(new String[] { "--bgcolor=#D4D0C8", "AspektWorld" });
	}
	public int direction = 0;
	public int last_direction = 0;
	public final static float MAX_SPEED = 50.0f;
	public final static float MIN_SPEED = 3.0f;
	public float speed = 50.0f;
	public float wd = 1600;
	public float hh = 900;
	public float dp = 1000;
	public PVector forward_heading;
	public PVector back_heading,left_heading,right_heading,up_heading,down_heading;
	public PVector straight_up, straight_left, straight_down, straight_right, straight_forward, straight_back;
	public float scalar;
	public int longest;
	public double ttheta;
	// public Rotation r;
	public int double_click;
	public float sbxs,sbys;
	public ArrayList<Line> lines;
	public int mouseLookOn = 0;
	public int verticesOn = 1;
	public int edgesOn = 1;
	public int gridOn = 1;
	public PMatrix3D currCameraMatrix;
	public PGraphics3D g3;
	PVector pos;


	@Override
	public void draw() {
		if(mouseLookOn == 0 && direction == 0)
			return;
		background(0);
		translate(pos.x,pos.y,pos.z);
		if(gridOn==1)
			draw_grid();
		//currCameraMatrix = new PMatrix3D(g3.camera);
		//camera();
		//if(matrix_panel_active != 0)
		//  draw_matrix_panel();
		//draw_controls();
		//g3.camera = currCameraMatrix;
		update_heading();
	}

	public void draw_grid() {
		int linum = lines.size();
		for(int i = 0; i < linum;i++) {
			Line lin = lines.get(i);
			lin.draw();
		} 
	}

	public void dvals() {
		pos = new PVector(2000,1000,-2000);
		forward_heading = new PVector(1000,-0,-1000);
		straight_up = new PVector(0,1,0);
		straight_down = new PVector(0,-1,0);
		straight_left = new PVector(-1,0,0);
		straight_right = new PVector(1,0,0);
		straight_forward = new PVector(0,0,1);
		straight_back = new PVector(0,0,-1);
		make_normals();
		camera(0,0,0, forward_heading.x, forward_heading.y, forward_heading.z, 0.0f, 1.0f, 0.0f);
	}


	public void input() {
		float mx = (mouseX);
		float my = (mouseY);
		mx = map(mx, 0, width, -1, 1);
		my = map(my, 0, height, -1, 1);
		float xang = (mx) * Math.abs(mx) / (20*PI);
		float yang = (my) * Math.abs(my) / (10*PI);
		if(mouseLookOn==1) {
			right_heading.mult(speed*sin(xang));
			forward_heading.mult(cos(xang));
			forward_heading.add(right_heading);
			straight_up.mult(speed*sin(yang));
			forward_heading.mult(cos(yang));
			forward_heading.add(straight_up);
		}
		camera(0,0,0, forward_heading.x, forward_heading.y, forward_heading.z, 0.0f, 1.0f, 0.0f);
		forward_heading.normalize();
		update_normals();
		forward_heading.mult(speed);
	}

	@Override
	public void keyPressed(){
		if(key != CODED)
			switch(key) {
			case('w'):case('W'):direction |=FORWARD; last_direction = FORWARD; break;
			case('d'):case('D'):direction |=RIGHTWARD; last_direction = RIGHTWARD; break;
			case('s'):case('S'):direction |=BACKWARD; last_direction = BACKWARD; break;
			case('a'):case('A'):direction |=LEFTWARD; last_direction = LEFTWARD; break;
			case(' '):direction |=UPWARD; last_direction = UPWARD; break;
			case('c'):case('C'):direction |=DOWNWARD; last_direction = DOWNWARD; break;

			case('g'):case('G'):
				gridOn ^= 1;
			break;
			case('v'):case('V'):
				verticesOn ^= 1;
			break;
			case('e'):case('E'):
				edgesOn ^= 1;
			break;
			}
		else {
			switch(keyCode) {
			case(SHIFT):
				if(speed > MIN_SPEED) {
					speed = MIN_SPEED;
					break;
				}
			}
		}
	}

	@Override
	public void keyReleased(){ 
		if(key != CODED)
			switch(key) {
			case('w'):case('W'):direction ^=FORWARD; last_direction = FORWARD; break;
			case('d'):case('D'):direction ^=RIGHTWARD; last_direction = RIGHTWARD; break;
			case('s'):case('S'):direction ^=BACKWARD; last_direction = BACKWARD; break;
			case('a'):case('A'):direction ^=LEFTWARD; last_direction = LEFTWARD; break;
			case(' '):direction ^=UPWARD; last_direction = UPWARD; break;
			case('c'):case('C'):direction ^=DOWNWARD; last_direction = DOWNWARD; break;

			} 
		else
			switch(keyCode) {
			case(SHIFT):
				if(speed < MAX_SPEED) {
					speed = MAX_SPEED;
					break;
				}
			}
	}

	public void make_grid() {
		float spacing = 200;
		lines = new ArrayList((int)(2*(wd+dp)/spacing + 1));
		stroke(200,255,255,255);
		for(float i = -wd*2; i <= wd*2; i+=spacing) {
			Line nl = new Line(this, i,0,-2*wd,i,0,2*wd);
			lines.add(nl);
		}
		for(float i = -wd*2; i <= wd*2; i+= spacing) {
			Line nl = new Line(this, -2*wd,0,i,2*wd,0,i);
			lines.add(nl);
		} 
		stroke(0,0,0,255);
	}


	public void make_normals() {
		back_heading = new PVector(-forward_heading.x, 0, -forward_heading.z);
		up_heading = new PVector(0,speed,0);
		down_heading = new PVector(0,-speed,0);
		right_heading = forward_heading.cross(up_heading);
		left_heading = forward_heading.cross(down_heading);
	}

	@Override
	public void mouseClicked() {
		if(mouseButton == RIGHT) {
			mouseLookOn ^= 1;
		}
		if(mouseEvent.getClickCount() == 2) {
			dvals();
			make_normals();
			make_grid();
			update_heading();
		}
	}

	@Override
	public void setup() {
		textSize(20);
		int xw = (screenWidth*15)/16;
		int yh = (screenHeight*7)/8;
		size(900,568,P3D);
		sbxs = width/50;
		sbys = -height/50;
		rectMode(CENTER);
		colorMode(HSB,360,255,255,255);
		longest = width < height ? 1 : 0;
		scalar = width < height ? width : height;
		g3 = (PGraphics3D)g;
		background(0);
		dvals();
		make_normals();
		make_grid();
		update_heading();
		fill(0,0,0,0);
		box(20,20,20);
		cursor(CROSS); 
		translate(pos.x,pos.y,pos.z);
		draw_grid();
	}

	public void update_heading() {
		input();
		update_v();
	}
	public void update_normals() {
		back_heading.set(-forward_heading.x, 0, -forward_heading.z);
		up_heading.set(0,speed,0);
		down_heading.set(0,-speed,0);
		straight_left.set(-1,0,0);
		straight_right.set(1,0,0);
		straight_forward.set(0,0,1);
		straight_back.set(0,0,-1);
		straight_up.set(0,1,0);
		straight_down.set(0,-1,0);
		right_heading = forward_heading.cross(straight_up);
		left_heading = forward_heading.cross(straight_down);
		back_heading.mult(speed);
		right_heading.mult(speed);
		left_heading.mult(speed);
	}
	public void update_v() {
		switch(direction) {
		case FORWARD:pos.sub(forward_heading); break;
		case BACKWARD:pos.sub(back_heading); break;
		case LEFTWARD:pos.sub(left_heading); break;
		case RIGHTWARD:pos.sub(right_heading); break;
		case UPWARD:pos.add(up_heading); break;
		case DOWNWARD:pos.add(down_heading); break;
		case FORWARD|LEFTWARD:pos.sub(forward_heading);pos.sub(left_heading); break;
		case FORWARD|RIGHTWARD:pos.sub(forward_heading);pos.sub(right_heading);  break;
		case BACKWARD|LEFTWARD:pos.sub(back_heading);pos.sub(left_heading);  break;
		case BACKWARD|RIGHTWARD:pos.sub(back_heading);pos.sub(right_heading);  break;
		case UPWARD|FORWARD:pos.sub(forward_heading);pos.add(up_heading);  break;
		case UPWARD|BACKWARD:pos.sub(back_heading);pos.add(up_heading);  break;
		case UPWARD|LEFTWARD:pos.add(up_heading);pos.sub(left_heading);  break;
		case UPWARD|RIGHTWARD:pos.add(up_heading);pos.sub(right_heading);  break;
		case DOWNWARD|FORWARD:pos.sub(forward_heading);pos.add(down_heading);  break;
		case DOWNWARD|BACKWARD:pos.sub(back_heading);pos.add(down_heading);  break;
		case DOWNWARD|LEFTWARD:pos.add(down_heading);pos.sub(left_heading);  break;
		case DOWNWARD|RIGHTWARD:pos.add(down_heading);pos.sub(right_heading);  break;
		case UPWARD|FORWARD|RIGHTWARD:pos.sub(forward_heading);pos.add(up_heading);pos.sub(right_heading);break;
		case UPWARD|FORWARD|LEFTWARD:pos.sub(forward_heading);pos.add(up_heading);pos.sub(left_heading);  break;
		case UPWARD|BACKWARD|RIGHTWARD:pos.sub(back_heading);pos.add(up_heading);pos.sub(right_heading);  break;
		case UPWARD|BACKWARD|LEFTWARD:pos.sub(back_heading);pos.add(up_heading);pos.sub(left_heading);  break;
		case DOWNWARD|FORWARD|LEFTWARD:pos.sub(forward_heading);pos.add(down_heading);pos.sub(left_heading);  break;
		case DOWNWARD|FORWARD|RIGHTWARD:pos.sub(forward_heading);pos.add(down_heading);pos.sub(right_heading);  break;
		case DOWNWARD|BACKWARD|LEFTWARD:pos.sub(back_heading);pos.add(down_heading);pos.sub(left_heading); break;
		case DOWNWARD|BACKWARD|RIGHTWARD:pos.sub(back_heading);pos.add(down_heading);pos.sub(right_heading);  break;
		case LEFTWARD|RIGHTWARD:
			if(last_direction==LEFTWARD)
				pos.sub(left_heading);
			else
				pos.sub(right_heading); 
			break;
		case FORWARD|BACKWARD:
			if(last_direction==FORWARD)
				pos.sub(forward_heading);
			else
				pos.sub(back_heading);
			break;
		case UPWARD|DOWNWARD:
			if(last_direction==UPWARD)
				pos.add(up_heading);
			else
				pos.add(down_heading);
			break;
		}
		if(pos.y < 100)
			pos.y = 100;
	}
}

