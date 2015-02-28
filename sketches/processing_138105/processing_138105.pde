
PFont screenText;
int screenW, screenH, asteroidCount;
int cellSize,remainingLives, timeA;
color cellColor;
Cell celula;
ArrayList<Asteroid> asteroids, asteroidsToRemove;
ArrayList<Bullet> bullets, bulletsToRemove;
HUD hud;
boolean accelerating, turningLeft, turningRight, waitingResponse, isPaused;
int gameState;
int maxBulletDistance;

void setup() 
{
	screenW = displayWidth;
	screenH = displayHeight;
	size(screenW, screenH);
	frame.removeNotify();
	frame.setUndecorated(true);
	frame.addNotify(); 
	smooth();
	noStroke();
	screenText = createFont("Verdana",16,true);
	maxBulletDistance = 150;
	gameState = 0;
}

void draw() 
{
	switch (gameState)
		// 0 = setup game
		// 1 waiting to start
		// 2 playing
		// default: game over
	{
					//reset game with remaining lives as param
		case 0 :	resetGame(4);
					break;
		case 1 :	if (waitingResponse)
					{
						//println("waiting for player to press A " + second());
						frame.setLocation(0,0);
						textFont(screenText,16);
						background(255);
						textAlign(CENTER);
						fill(255,100,0);
						text("PRESS 'A' TO START THE GAME", screenW/2, screenH/2);
					}
					break;
		case 2 :	if ((remainingLives >= 0) && !(waitingResponse))
					{
						if (!(isPaused))
						{
							playing();
						}
						else
						{
							frame.setLocation(0,0);
							textFont(screenText,16);
							background(180,180,180);
							textAlign(CENTER);
							fill(255,100,0);
							text("GAME PAUSED", screenW/2, screenH/2);
						}
					}
					else if ((remainingLives <= 0) && (waitingResponse))
					{
						gameState = 0;
					}
					break;
		default :	if( abs(timeA - second()) < 5 )
						gameOver();
					else
						gameState = 0;
					break;	
	}

	
}

void keyPressed()
{
	if (key == CODED) 
	{
		switch (keyCode) 
		{
			case UP   :	accelerating = true;
						break;
			case LEFT :	turningLeft = true;
						break;	
			case RIGHT: turningRight = true;
						break;
			default :	break;	
		}
	}
	else
	{
		switch (key)
		{
			case ' ' :  bullets.add(new Bullet());
						break;
			case 'a' :  gameState = 2;
						waitingResponse = false;
						break;
			case 'p' :	isPaused = !isPaused;
						break;
            case ENTER: resetGame(4);
                        gameState = 0;
                        break;
			default :	break;	
		}
	}
}

void resetGame(int lives)
{
	//println(">>>>>>>>>>>>>setting asteroids bullets and stuff<<<<<<<<<<<<<");
	asteroids = new ArrayList<Asteroid>();
	bullets = new ArrayList<Bullet>();
	bulletsToRemove = new ArrayList<Bullet>();
	asteroidsToRemove = new ArrayList<Asteroid>();
	cellColor = color(0,100,255);
	accelerating = false;
	turningLeft = false;
	turningRight = false;
	isPaused = false;
	waitingResponse = true;
	asteroidCount = 20;
	remainingLives = --lives;
	gameState = 1;

	// Cell (float x, float y, float speed, float direction) 
	celula = new Cell(screenW/2,screenH/2,0,0);
	hud = new HUD();
	for (int i = 0; i < asteroidCount; i++)
	{
		//println("creating asteroids <<<<<<<<<<<<<");
		asteroids.add(new Asteroid(int(random(1,3.9))));
	}
	
	//println("game state set");
}

void playing()
{
	//println("Seems to be playing -.- " + second());
	background(0);
	textAlign(LEFT);
	frame.setLocation(0,0);
	textFont(screenText,16);

	for (Asteroid a : asteroids)
	{
     	a.update();	
	}

	for (Bullet b : bullets)
	{
    	b.update();
	}

	fill(cellColor);
	celula.update();
	celula.display();
	for (Asteroid a : asteroids)
    {
    	for (Bullet b : bullets)
		{
	    	if (a.hasCollide(b))
	    	{
	    		asteroidsToRemove.add(a);
	    		bulletsToRemove.add(b);
	    	}
		}

    	if (celula.hasCollide(a))
     	{
     		// RESET SCENE, SUBSTRACT A LIFE
     		if (remainingLives == 0)
     		{
     			gameState = 3;
     			timeA = second();
     		}
     		else if (a.isAlive)
     		{
     			resetGame(remainingLives);
		 		//fill(255,50,0);
		 		//text("COLLISION DETECTED!",20,100);	
     		}
     	}
    }
    //removing elements from lists as they've been destroyed
    for (Asteroid a : asteroidsToRemove)
    {
    	asteroids.remove(a);
    }
    for (Bullet b : bullets)
    {
    	if ( dist(b.initPos.x,b.initPos.y,b.position.x,b.position.y) > maxBulletDistance)
    	{
    		bulletsToRemove.add(b);
    	}
    }
    for (Bullet b : bulletsToRemove)
    {
    	bullets.remove(b);
    }
    //currently doing nothing, should record score and such
	hud.update();
	// must set to false for whenever no key is pressed
	accelerating = false;
	turningLeft = false;
	turningRight = false;
}

void gameOver()
{
	frame.setLocation(0,0);
	background(255,100,100);
	textAlign(CENTER);
	textFont(screenText,50);     			
	fill(255);
	text("GAME OVER!", screenW/2, screenH/2);
	textFont(screenText,20);     			
	text("INTRO to restart or wait...", screenW/2, screenH/1.5);
	//println("-------------------------------> you lose");
	waitingResponse = true;		
}
public class Asteroid implements ICollidable{

	PVector position;
	PVector velocity;
	// asteroid size can be 5, 20 or 60
	int size;
	boolean isAlive;

	//param can be 1, 2 or 3
	public Asteroid (int size) 
	{
		position = new PVector(random(0,screenW),random(0, screenH));
		isAlive = true;

		if( (((position.x) > ((screenW/2)-3*cellSize))  && 
			 ((position.x) < ((screenW/2)+3*cellSize))) && 
			(((position.y) > ((screenH/2)-3*cellSize))  && 
			 ((position.y) < ((screenH/2)+3*cellSize))) )
		{	
			//adds arbitrary offset if asteroid spawns over ship
			position.x += 100;
			position.y += 100;
		}

		switch (size) 
		{
			case 1 :	this.size = 5*size;
						break;	
			case 2 :	this.size = 10*size;
						break;
			case 3 :	this.size = 20*size;
						break;
			default :	
						break;	
		}
		float angle = random(-2*PI,2*PI);
		velocity = new PVector(cos(angle),sin(angle));
	}

	public void update()
	{
		if (isAlive)
		{
			position.add(velocity);
			if ( position.x > screenW ) { position.x -= screenW;}
			if ( position.x < 0 ) 		{ position.x += screenW;}
			if ( position.y > screenH ) { position.y -= screenH;}
			if ( position.y < 0 ) 		{ position.y += screenH;}
			this.display();		
		}
	}

	private void display()
	{
		//ahora son circulos pero deberia reemplazarse
		//con algun asset de piedra o algo asi
		stroke(255);
		fill(0,0);
		ellipse(position.x,position.y,this.size,this.size);
	}

	public boolean hasCollide (Object o)
	{
		Bullet b = (Bullet)o;
		if (((dist(position.x, position.y, b.position.x, b.position.y)-(size/2)-b.size)) <= 1 )
		{
			isAlive = false;
			return true;
		} 
		else
			return false;
	}
}
public class Bullet
{
	PVector initPos,position;
	PVector velocity;
	int size;
	float angle;

	public Bullet () {
		this.initPos = new PVector(celula.position.x,celula.position.y);
		this.position = new PVector(celula.position.x,celula.position.y);
		this.velocity = new PVector(celula.velocity.x, celula.velocity.y);
		size = 5;
		this.angle = celula.getAngle();
	}

	public void update()
	{
		this.position.add(velocity);
		this.velocity.x = 3*(cos(this.angle));
		this.velocity.y = 3*(sin(this.angle));
		this.display();
	}

	private void display()
	{
		pushMatrix();
			translate(position.x, position.y);
			rotate(angle);
			noStroke();
			fill(255,50,50);
			ellipse(cellSize*2, 0, size,size);
			stroke(0);
		popMatrix();
	}
}
public class Cell implements ICollidable{

	private PVector position;
	private PVector velocity;
	private PVector thrust;
	private float angle;
	private int cohesionDistance;
	private int repulsionDistance;
	private int maxSpeed;

	public Cell (float x, float y, float speed, float direction) 
	{
		position = new PVector(x,y);
		velocity = new PVector(speed,direction);
		thrust = new PVector(0,0);
		angle = -PI/2;
		//HACK, cellSize should be passed as a parameter, lazy me
		cellSize = 7;
		maxSpeed = 10;
	}

	public void setPosition (PVector v)
	{
		position = v;
	}

	public PVector getPosition()
	{
		return position;
	}

	public void setVelocity (PVector v)
	{
		velocity.add(v);
	}

	public PVector getVelocity()
	{
		return velocity;
	}

	public void setAngle(float a) 
	{
		angle = a;
	}

	public void setAngle(PVector p) 
	{
		angle = angle = atan2(p.y,p.x);
	}

	public float getAngle() 
	{
		return angle;
	}

	public void update() 
	{
		position.add(velocity);
		
		if (accelerating)
		{
			if( (angle == -PI/2) || (angle == PI/2) )
				thrust.y = sin(angle);
			else
				thrust.x = cos(angle);
			
			velocity.add(thrust);
		}
		else
			thrust.x = 0;

		if (turningLeft)
		{
			angle -= 0.1;
			thrust.y = sin(angle);
		}
		if (turningRight)
		{
			angle += 0.1;
			thrust.y = sin(angle);
		}
		if ( position.x > screenW ) { position.x -= screenW;}
		if ( position.x < 0 ) 		{ position.x += screenW;}
		if ( position.y > screenH ) { position.y -= screenH;}
		if ( position.y < 0 ) 		{ position.y += screenH;}
	}

	public void display()
	{
		//ellipse(position.x,position.y,cellSize,cellSize);
		pushMatrix();
			translate(position.x, position.y);
			rotate(angle);
			stroke(255);
			triangle(-cellSize, -cellSize, -cellSize, cellSize, cellSize*2, 0);
		popMatrix();
	}

	public boolean hasCollide(Object o)
	{
		Asteroid a = (Asteroid) o;
		if ((dist(position.x, position.y, a.position.x, a.position.y)-(cellSize*1.5)-(a.size/2)) <= 2 ) 
			return true;
		else
			return false;
	}

}
public class HUD {

	public HUD () 
	{
	}

	public void update()
	{
		display();
	}

	private void display()
	{
		//debug
		fill(10,255,0);
		/*
	    text("Ship speed      : " + celula.velocity.x,20,40);
	    text("Ship direction  : " + celula.velocity.y,20,60);
	    text("Ship angle (rad): " + celula.angle,20,80);
	    text("isPaused        : " + isPaused,20,100);
	    */
		text("LIVES           : " + remainingLives,20,20);
	}

}
public interface ICollidable
{
	public boolean hasCollide(Object o);
}


