
// L-system explorer  
// Use the mouse to move and zoom.
// Press "<" and ">" to select from 15 different L-systems to explore.
// Press "n" for the next iteration.  Press "p" for the previous iteration.
// Press "i" to toggle the cycling of the iterations.
// Press "q" to toggle the progressive coloring.
// Press "w" to toggle grayscale progressive coloring.
// Press "a" to toggle alpha progressive coloring.
// Press "e" to toggle black and white coloring.
// Press "+" to increase the stroke weight.  Press "-" to decrease the stroke weight.
// Press "r" to toggle the show rendering.
// Press "k" and "l" to increase and decrease the frame rate.
// Press "t" to toggle a turtle pen on and off.
// Press "[" and "]" to increase and decrease the turtle size.
// Press "g" to toggle graph paper on and off.
// Press "z" to zoom in.  Press "x" to zoom out.
// Press "s" to snap to grid when moving.
// http://en.wikipedia.org/wiki/L-system

// (c) David Balash 2012
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int SKETCH_WIDTH = 750;
final int SKETCH_HEIGHT = 750;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int FRAMES_PER_SECOND_INCREMENT = 5;
final int TURTLE_SIZE_INCREMENT = 4;

int framesPerSecond = 100;
int cycleStartTime = 0;
int cycleTimeInMilliSeconds = 900;
int lSystemListIndex = 15;
PMatrix baseMatrix; 
List<D0LSystem> lSystemList = new ArrayList<D0LSystem>();
boolean toggleCycleIteration = false;
boolean toggleGraphPaper = false;
boolean toggleRender = false;
boolean snapToGrid = false;


void setup()
{
    size(SKETCH_WIDTH, SKETCH_HEIGHT);
    baseMatrix = g.getMatrix();
    background(BACKGROUND_COLOR);
    smooth();
    noFill();
	frameRate(framesPerSecond);
	
	addMouseWheelListener(
		new java.awt.event.MouseWheelListener() 
		{ 
	    	public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt)
	    	{ 
	      		mouseWheel(evt.getWheelRotation());
	  		}
	    }
    ); 
	
	lSystemInitialization();
	lSystemList.get(lSystemListIndex).generate();
}	


void graphPaper()
{
	pushMatrix();
	applyMatrix(baseMatrix);
	
	int graphSize = 10;
	int graphPaperColor = 0xFFC0D9D9;
	int graphPaperWeight = 1;
	int graphPaperWeightBold = 2;
	
	stroke(graphPaperColor);
	
	for(int x = 0; x < width; x += graphSize)
	{
		for(int y = 0; y < height; y += graphSize)
		{
			if ((x % 100 == 0))
			{
				strokeWeight(graphPaperWeightBold);
				line(x, y, x, height);
			}
			else 
			{
				strokeWeight(graphPaperWeight);
				line(x, y, x, height);	
			}

			if ((y % 100 == 0))
			{
				strokeWeight(graphPaperWeightBold);
				line(x, y, width, y);
			}
			else 
			{
				strokeWeight(graphPaperWeight);	
				line(x, y, width, y);
			}			  
		}
	}
	popMatrix();
}

	
void draw()
{	
	background(BACKGROUND_COLOR);
	
	if (toggleGraphPaper)
	{
		graphPaper();
	}
	
	mouseMovement();
	
	if (toggleCycleIteration)
	{
		cycleIteration();
	}
	
	lSystemList.get(lSystemListIndex).show();
}


void cycleIteration()
{
	int currentIteration = lSystemList.get(lSystemListIndex).getIteration();
	int maxIteration = lSystemList.get(lSystemListIndex).getMaxIteration();
	int minIteration = lSystemList.get(lSystemListIndex).getMinIteration();
	
	if (cycleStartTime == 0)
	{
		cycleStartTime = millis();
	}
	else if (millis() - cycleStartTime > cycleTimeInMilliSeconds)
	{
		if (currentIteration == maxIteration)
		{
			lSystemList.get(lSystemListIndex).setIteration(minIteration);		
		}
		else 
		{
			lSystemList.get(lSystemListIndex).setIteration(currentIteration + 1);
		}
		cycleStartTime = millis();
	}
}


void mouseMovement()
{
	if(mouseButton == LEFT)
	{
		if(mousePressed == true)
		{
			if (snapToGrid)
			{
				float mouseDeltaX = (mouseX - pmouseX);
				float mouseDeltaY = (mouseY - pmouseY);
				
				int snapMoveX = round(mouseDeltaX / 10f);
				int snapMoveY = round(mouseDeltaY / 10f);
				
				lSystemList.get(lSystemListIndex).setMoveInX(round(lSystemList.get(lSystemListIndex).getMoveInX() + (snapMoveX * 10)));
				lSystemList.get(lSystemListIndex).setMoveInY(round(lSystemList.get(lSystemListIndex).getMoveInY() + (snapMoveY * 10)));	
			}
			else 
			{
				lSystemList.get(lSystemListIndex).setMoveInX(round(lSystemList.get(lSystemListIndex).getMoveInX() + (mouseX - pmouseX)));
				lSystemList.get(lSystemListIndex).setMoveInY(round(lSystemList.get(lSystemListIndex).getMoveInY() + (mouseY - pmouseY)));	
			}
			cursor(HAND);
		}
		else
		{
			cursor(ARROW);
		}
	}
	else
	{
		cursor(ARROW);
	}
}


void mouseWheel(int delta) 
{
	if (delta < 0)
	{
		lSystemList.get(lSystemListIndex).setScalar(lSystemList.get(lSystemListIndex).getScalar() + 0.1);
	}
	else 
	{
		if (lSystemList.get(lSystemListIndex).getScalar() > 0.1)
		{
			lSystemList.get(lSystemListIndex).setScalar(lSystemList.get(lSystemListIndex).getScalar() - 0.1);
		}
	}  	
}


void keyPressed() 
{  
	if (Character.getType(key) == Character.DECIMAL_DIGIT_NUMBER)
	{
		lSystemListIndex = Integer.parseInt(Character.toString(key));
		lSystemList.get(lSystemListIndex).generate();
	}
	else if (key == '<' || key == ',')
	{
		lSystemListIndex--;
		if (lSystemListIndex < 0)
		{
			lSystemListIndex = lSystemList.size() - 1;
		}
		lSystemList.get(lSystemListIndex).generate();
	}
	else if (key == '>' || key == '.')
	{
		lSystemListIndex++;
		if (lSystemListIndex == lSystemList.size())
		{
			lSystemListIndex = 0;
		}
		lSystemList.get(lSystemListIndex).generate();
	}
	else if (key == '[')
	{
		float currentTurtleSize = lSystemList.get(lSystemListIndex).getTurtleSize();
		if (currentTurtleSize - TURTLE_SIZE_INCREMENT > 0)
		{
			lSystemList.get(lSystemListIndex).setTurtleSize(currentTurtleSize - TURTLE_SIZE_INCREMENT);
		}
	}
	else if (key == ']')
	{
		lSystemList.get(lSystemListIndex).setTurtleSize(lSystemList.get(lSystemListIndex).getTurtleSize() + TURTLE_SIZE_INCREMENT);
	}
	else if (key == 'k')
	{
		if (framesPerSecond - FRAMES_PER_SECOND_INCREMENT > 0)
		{
			framesPerSecond -= FRAMES_PER_SECOND_INCREMENT;
		}
		frameRate(framesPerSecond);
	}
	else if (key == 'l')
	{
		framesPerSecond += FRAMES_PER_SECOND_INCREMENT;
		frameRate(framesPerSecond);
	}						
	else if (key == 'n')
	{
		lSystemList.get(lSystemListIndex).nextIteration();
	}
	else if (key == 'p')
	{
		lSystemList.get(lSystemListIndex).previousIteration();
	}
	else if (key == 'i')
	{
		if(toggleCycleIteration)
		{
			toggleCycleIteration = false;
			cycleStartTime = 0;
		}
		else 
		{
			toggleCycleIteration = true;
		} 
	}	
	else if (key == 'z')
	{
		lSystemList.get(lSystemListIndex).setScalar(lSystemList.get(lSystemListIndex).getScalar() + 0.1);
	}
	else if (key == 'x')
	{
		if (lSystemList.get(lSystemListIndex).getScalar() > 0.1)
		{
			lSystemList.get(lSystemListIndex).setScalar(lSystemList.get(lSystemListIndex).getScalar() - 0.1);
		}
	}
	else if (key == 'r')
	{
		if(toggleRender)
		{
			toggleRender = false;
		}
		else 
		{
			toggleRender = true;
		} 

		lSystemList.get(lSystemListIndex).setShowLSytemInProgress(toggleRender);
	}
	else if (key == '+')
	{
		lSystemList.get(lSystemListIndex).setStrokeWeight(lSystemList.get(lSystemListIndex).getStrokeWeight() + 0.5);
	}
	else if (key == '-' || key == '_')
	{
		if (lSystemList.get(lSystemListIndex).getStrokeWeight() - 0.5 > 0)
		{
			lSystemList.get(lSystemListIndex).setStrokeWeight(lSystemList.get(lSystemListIndex).getStrokeWeight() - 0.5);
		}
	}
	else if (key == 'g')
	{
		if(toggleGraphPaper)
		{
			toggleGraphPaper = false;
		}
		else 
		{
			toggleGraphPaper = true;
		} 
	}
	else if (key == 's')
	{
		if(snapToGrid)
		{
			snapToGrid = false;
		}
		else 
		{
			lSystemList.get(lSystemListIndex).setMoveInX(round(lSystemList.get(lSystemListIndex).getMoveInX() / 10f) * 10);
			lSystemList.get(lSystemListIndex).setMoveInY(round(lSystemList.get(lSystemListIndex).getMoveInY() / 10f) * 10);	
			snapToGrid = true;
		} 
	}
	else if (key == 't')
	{
		if(lSystemList.get(lSystemListIndex).isTurtleOn())
		{
			lSystemList.get(lSystemListIndex).setTurtleOn(false);
		}
		else 
		{
			lSystemList.get(lSystemListIndex).setTurtleOn(true);
		} 		
	}	
	else if (key == 'q')
	{
		if(lSystemList.get(lSystemListIndex).isProgressColoring())
		{
			lSystemList.get(lSystemListIndex).setProgressColoring(false);
		}
		else 
		{
			lSystemList.get(lSystemListIndex).setProgressColoring(true);
			lSystemList.get(lSystemListIndex).setProgressColoringGrayscale(false);
			lSystemList.get(lSystemListIndex).setBlackAndWhite(false);
		} 
	}
	else if (key == 'w')
	{
		if(lSystemList.get(lSystemListIndex).isProgressColoringGrayscale())
		{
			lSystemList.get(lSystemListIndex).setProgressColoringGrayscale(false);
		}
		else 
		{
			lSystemList.get(lSystemListIndex).setProgressColoringGrayscale(true);
			lSystemList.get(lSystemListIndex).setProgressColoring(false);
			lSystemList.get(lSystemListIndex).setBlackAndWhite(false);
		} 
	}
	else if (key == 'a')
	{
		if(lSystemList.get(lSystemListIndex).isProgressColoringAlpha())
		{
			lSystemList.get(lSystemListIndex).setProgressColoringAlpha(false);
		}
		else 
		{
			lSystemList.get(lSystemListIndex).setProgressColoringAlpha(true);
		} 
	}
	else if (key == 'e')
	{
		if(lSystemList.get(lSystemListIndex).isBlackAndWhite())
		{
			lSystemList.get(lSystemListIndex).setBlackAndWhite(false);
		}
		else 
		{
			lSystemList.get(lSystemListIndex).setBlackAndWhite(true);
			lSystemList.get(lSystemListIndex).setProgressColoringGrayscale(false);
			lSystemList.get(lSystemListIndex).setProgressColoring(false);
		} 
	}					
}


PVector[] populateStartLocationArray(int maxIteration, PVector location)
{
	int arraySize = maxIteration + 1;
	PVector[] startLocationArray = new PVector[arraySize];
	for (int i = 0; i < arraySize; i++)
	{
		startLocationArray[i] = location;
	}
	return startLocationArray;
}


void lSystemInitialization()
{
	Map variables;
	Map symbols;
	String axiom;
	Map productionRules;
	float strokeWeight;
	color strokeColor;
	PVector[] startLocation;
	HilbertDistanceReduction hilbertDistanceReduction = new HilbertDistanceReduction();
	int iteration;
	int minIteration;
	int maxIteration;
	// http://commons.wikimedia.org/wiki/File:Kturtle_top_view.svg
	// http://commons.wikimedia.org/wiki/File:Kturtle_side_view_(RGB).svg
	PShape turtle = loadShape("TurtleTopView.svg");
	float turtleSize = 40;
	boolean isTurtleOn = false;
	boolean isBlackAndWhite = false;
	boolean isProgressColoring = true;
	boolean isProgressColoringGrayscale = false;
	boolean isProgressColoringAlpha = false;
	
	
	// Curve 0
	// Koch Curve 
	// http://en.wikipedia.org/wiki/Koch_curve
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 243");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "F-F+F+F-F");	
	
	iteration = 5;
	minIteration = 0;
	maxIteration = 7;
	
	strokeWeight = 1.5;
	strokeColor = color(0xFF4D4DFF);
	
	startLocation = populateStartLocationArray(maxIteration, new PVector(10, 550));
	
	KochDistanceReduction kochDistanceReduction = new KochDistanceReduction();
	
	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, kochDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 1
	// Koch Lakes and Islands
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 60");
	variables.put("f", "MOVE_FORWARD 60");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F+F+F+F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "F+f-FF+F+FF+Ff+FF-f+FF-F-FF-Ff-FFF");	
	productionRules.put("f", "ffffff");
	
	iteration = 3;
	minIteration = 0;
	maxIteration = 3;
	
	strokeWeight = 1.0;
	strokeColor = color(0xFFA8A8A8);
	
	startLocation = populateStartLocationArray(maxIteration, new PVector(191, 191));

	KochLakesAndIslandsDistanceReduction kochLakesAndIslandsDistanceReduction = new KochLakesAndIslandsDistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, kochLakesAndIslandsDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 2
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 620");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F-F-F-F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "FF-F-F-F-F-F+F");	
	
	iteration = 4;
	minIteration = 0;
	maxIteration = 4;	
	
	strokeWeight = 1.5;
	strokeColor = color(0xFF238E23);
	
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(61, 680);
	startLocation[1] = new PVector(216, 680);
	startLocation[2] = new PVector(326, 680);
	startLocation[3] = new PVector(427, 680);
	startLocation[4] = new PVector(532, 680);
	
	Koch2DistanceReduction koch2DistanceReduction = new Koch2DistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, koch2DistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 3
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 215");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F-F-F-F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "FF-F-F-F-FF");	
	
	iteration = 4;
	minIteration = 0;
	maxIteration = 5;	
	
	strokeWeight = 2.0;
	strokeColor = color(0xFF6B238E);
	
	startLocation = populateStartLocationArray(maxIteration, new PVector(51, 695));

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, kochDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 4
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 625");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F-F-F-F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "FF-F+F-F-FF");	
	
	iteration = 4;
	minIteration = 0;
	maxIteration = 4;
	
	strokeWeight = 2.0;
	strokeColor = color(0xFFE47833);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(61, 685);
	startLocation[1] = new PVector(61, 477);
	startLocation[2] = new PVector(516, 231);
	startLocation[3] = new PVector(596, 300);
	startLocation[4] = new PVector(245, 501);

	Koch4DistanceReduction koch4DistanceReduction = new Koch4DistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, koch4DistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 5
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 215");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F-F-F-F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "FF-F--F-F");	
	
	iteration = 5;
	minIteration = 0;
	maxIteration = 6;
	
	strokeWeight = 1.5;
	strokeColor = color(0xFF5C3317);
	
	startLocation = populateStartLocationArray(maxIteration, new PVector(52, 699));

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, kochDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 6
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 625");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F-F-F-F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "F-FF--F-F");	
	
	iteration = 5;
	minIteration = 0;
	maxIteration = 5;
	
	strokeWeight = 1.5;
	strokeColor = color(0xFFFF2400);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(61, 685);
	startLocation[1] = new PVector(269, 685);
	startLocation[2] = new PVector(418, 685);
	startLocation[3] = new PVector(561, 644);
	startLocation[4] = new PVector(635, 517);
	startLocation[5] = new PVector(663, 384);

	Koch6DistanceReduction koch6DistanceReduction = new Koch6DistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, koch6DistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 7
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 615");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "F-F-F-F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "F-F+F-F-F");	
	
	iteration = 5;
	minIteration = 0;
	maxIteration = 5;
	
	strokeWeight = 2.0;
	strokeColor = color(0xFFCD7F32);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(61, 675);
	startLocation[1] = new PVector(61, 470);
	startLocation[2] = new PVector(148, 587);
	startLocation[3] = new PVector(97, 458);
	startLocation[4] = new PVector(160, 576);
	startLocation[5] = new PVector(104, 457);

	Koch7DistanceReduction koch7DistanceReduction = new Koch7DistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, koch7DistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Gosper Curve 8
	// http://en.wikipedia.org/wiki/Gosper_curve
	variables = new HashMap<String, String>();
	variables.put("X", "DRAW_FORWARD 245");
	variables.put("Y", "DRAW_FORWARD 245");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 60");
	symbols.put("-", "TURN_LEFT 60");
	
	axiom = "X";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("X", "X+Y++Y-X--XX-Y+");	
	productionRules.put("Y", "-X+YY++Y+X--X-Y");
	
	iteration = 5;
	minIteration = 1;
	maxIteration = 5;
	
	strokeWeight = 2.0;
	strokeColor = color(0xFFFF7F00);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[1] = new PVector(70, 160);
	startLocation[2] = new PVector(250, 90);
	startLocation[3] = new PVector(360, 60);
	startLocation[4] = new PVector(460, 60);
	startLocation[5] = new PVector(570, 100);
	
	GosperDistanceReduction gosperDistanceReduction = new GosperDistanceReduction();
	
	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, gosperDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Curve 9
	variables = new HashMap<String, String>();
	variables.put("X", "DRAW_FORWARD 630");
	variables.put("Y", "DRAW_FORWARD 630");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "-Y";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("X", "XX-Y-Y+X+X-Y-YX+Y+XXY-X+Y+XX+Y-XY-Y-X+X+YY-");	
	productionRules.put("Y", "+XX-Y-Y+X+XY+X-YY-X-Y+XYY-X-YX+X+Y-Y-X+X+YY");
	
	iteration = 3;
	minIteration = 0;
	maxIteration = 4;
	
	strokeWeight = 3.0;
	strokeColor = color(0xFF5C4033);
	
	startLocation = populateStartLocationArray(maxIteration, new PVector(60, 690));

	Koch9DistanceReduction koch9DistanceReduction = new Koch9DistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, koch9DistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));
			

	// Hilbert
	// http://en.wikipedia.org/wiki/Hilbert_curve
	variables = new HashMap<String, String>();
	variables.put("A", "");
	variables.put("B", "");
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 630");
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "A";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("A", "-BF+AFA+FB-");	
	productionRules.put("B", "+AF-BFB-FA+");
	
	iteration = 6;
	minIteration = 1;
	maxIteration = 8;
	
	strokeWeight = 3.0;
	strokeColor = color(0XFF5959AB);
	
	startLocation = populateStartLocationArray(maxIteration, new PVector(62, 692));

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, hilbertDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));
			
			
	// Moore
	variables = new HashMap<String, String>();
	variables.put("A", "");
	variables.put("B", "");
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 650");
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "AFA+F+AFA";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("A", "-BF+AFA+FB-");	
	productionRules.put("B", "+AF-BFB-FA+");
	
	iteration = 5;
	minIteration = 0;
	maxIteration = 7;
	
	strokeWeight = 3.0;
	strokeColor = color(0XFF871F78);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(50, 50);
	startLocation[1] = new PVector(50, 264);
	startLocation[2] = new PVector(50, 328);
	startLocation[3] = new PVector(50, 352);
	startLocation[4] = new PVector(50, 366);
	startLocation[5] = new PVector(50, 370);
	startLocation[6] = new PVector(50, 373);
	startLocation[7] = new PVector(50, 375);

	MooreDistanceReduction mooreDistanceReduction = new MooreDistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, mooreDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Peano
	variables = new HashMap<String, String>();
	variables.put("A", "");
	variables.put("B", "");
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 630");
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "A";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("A", "AFBFA-F-BFAFB+F+AFBFA");	
	productionRules.put("B", "BFAFB+F+AFBFA-F-BFAFB");
	
	iteration = 4;
	minIteration = 1;
	maxIteration = 5;
	
	strokeWeight = 3.0;
	strokeColor = color(0XFF7FFF00);
	
	startLocation = populateStartLocationArray(maxIteration, new PVector(60, 690));

	PeanoDistanceReduction peanoDistanceReduction = new PeanoDistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, peanoDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Sierpinski Triangle
	variables = new HashMap<String, String>();
	variables.put("A", "DRAW_FORWARD 750");
	variables.put("B", "DRAW_FORWARD 750");	
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 60");
	symbols.put("-", "TURN_LEFT 60");
	
	axiom = "A";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("A", "B-A-B");	
	productionRules.put("B", "A+B+A");
	
	iteration = 7;
	minIteration = 0;
	maxIteration = 9;
	
	strokeWeight = 2.0;
	strokeColor = color(0XFF00009C);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(50, 90);
	startLocation[1] = new PVector(50, SKETCH_HEIGHT - 90);
	startLocation[2] = new PVector(50, 90);
	startLocation[3] = new PVector(50, SKETCH_HEIGHT - 90);
	startLocation[4] = new PVector(50, 90);
	startLocation[5] = new PVector(50, SKETCH_HEIGHT - 90);
	startLocation[6] = new PVector(50, 90);
	startLocation[7] = new PVector(50, SKETCH_HEIGHT - 90);
	startLocation[8] = new PVector(50, 90);
	startLocation[9] = new PVector(50, SKETCH_HEIGHT - 90);

	SierpinskiDistanceReduction sierpinskiDistanceReduction = new SierpinskiDistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, sierpinskiDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));		


	// David Tour
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 700");
	variables.put("X", "");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 60");
	symbols.put("-", "TURN_LEFT 60");
	symbols.put("!", "REVERSE_DIRECTIONS");
	
	axiom = "FX-XFX-XFX-XFX-XFX-XF";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "!F!-F-!F!");
	productionRules.put("X", "!X");
	
	iteration = 6;
	minIteration = 0;
	maxIteration = 7;
	
	strokeWeight = 2.0;
	strokeColor = color(0XFF00009C);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(263, 550);
	startLocation[1] = new PVector(471, 544);
	startLocation[2] = new PVector(276, 546);
	startLocation[3] = new PVector(478, 549);
	startLocation[4] = new PVector(276, 549);
	startLocation[5] = new PVector(478, 549);
	startLocation[6] = new PVector(276, 549);
	startLocation[7] = new PVector(478, 549);

	DavidTourDistanceReduction davidTourDistanceReduction = new DavidTourDistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, davidTourDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));


	// Dragon Curve
	variables = new HashMap<String, String>();
	variables.put("X", "");
	variables.put("Y", "");
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 700");
	symbols.put("+", "TURN_RIGHT 90");
	symbols.put("-", "TURN_LEFT 90");
	
	axiom = "FX";

	productionRules = new HashMap<String, String>();
	productionRules.put("X", "X+YF");
	productionRules.put("Y", "FX-Y");
	
	iteration = 13;
	minIteration = 0;
	maxIteration = 16;
	
	strokeWeight = 2.0;
	strokeColor = color(0XFFFF0000);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(25, 375);
	startLocation[1] = new PVector(25, 25);
	startLocation[2] = new PVector(188, 25);
	startLocation[3] = new PVector(490, 188);
	startLocation[4] = new PVector(585, 305);
	startLocation[5] = new PVector(575, 525);
	startLocation[6] = new PVector(470, 600);
	startLocation[7] = new PVector(259, 559);
	startLocation[8] = new PVector(179, 450);
	startLocation[9] = new PVector(190, 251);
	startLocation[10] = new PVector(296, 174);
	startLocation[11] = new PVector(494, 199);
	startLocation[12] = new PVector(571, 300);
	startLocation[13] = new PVector(553, 495);
	startLocation[14] = new PVector(456, 573);
	startLocation[15] = new PVector(261, 553);
	startLocation[16] = new PVector(182, 453);

	DragonDistanceReduction dragonDistanceReduction = new DragonDistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules, 
			strokeWeight, strokeColor, startLocation, dragonDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring, 
			isProgressColoringGrayscale, isProgressColoringAlpha));	


	// Terdragon
	variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD 700");
	
	symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 120");
	symbols.put("-", "TURN_LEFT 120");
	
	axiom = "F";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("F", "F+F-F");
	
	iteration = 7;
	minIteration = 0;
	maxIteration = 9;
	
	strokeWeight = 2.0;
	strokeColor = color(0XFF8E2323);
	
	startLocation = new PVector[maxIteration + 1];
	startLocation[0] = new PVector(25, 375);
	startLocation[1] = new PVector(25, 170);
	startLocation[2] = new PVector(200, 70);
	startLocation[3] = new PVector(377, 70);
	startLocation[4] = new PVector(585, 10);
	startLocation[5] = new PVector(661, 191);
	startLocation[6] = new PVector(691, 373);
	startLocation[7] = new PVector(700, 560);
	startLocation[8] = new PVector(563, 652);
	startLocation[9] = new PVector(401, 679);

	TerDragonDistanceReduction terDragonDistanceReduction = new TerDragonDistanceReduction();

	lSystemList.add(
		new D0LSystem(
			variables, symbols, axiom, productionRules,
			strokeWeight, strokeColor, startLocation, terDragonDistanceReduction,
			iteration, minIteration, maxIteration,
			turtle, turtleSize, isTurtleOn,
			isBlackAndWhite, isProgressColoring,
			isProgressColoringGrayscale, isProgressColoringAlpha));									
}


class KochDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		return distance / (pow(3, iteration - 1));
	}
}


class Koch2DistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		float distanceDivisor = 4;
		if (iteration < 1)
		{
			distanceDivisor = 1;
		}
		else if (iteration > 1)
		{
			for (int i = 1; i < iteration; i++)
			{
				distanceDivisor = (distanceDivisor * 3) + 2;
			}
		}		
		return distance / distanceDivisor;
	}
}


class Koch4DistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		float distanceDivisor = 1;
		if (iteration == 1)
		{
			distanceDivisor = 3;
		}
		else if (iteration == 2)
		{
			distanceDivisor = 11;
		}
		else if (iteration == 3)
		{
			distanceDivisor = 21;
		}
		else if (iteration == 4)
		{
			distanceDivisor = 61;
		}
		return distance / distanceDivisor;
	}
}


class Koch6DistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		float distanceDivisor = 1;
		if (iteration == 1)
		{
			distanceDivisor = 3;
		}
		else if (iteration == 2)
		{
			distanceDivisor = 7;
		}
		else if (iteration == 3)
		{
			distanceDivisor = 15;
		}
		else if (iteration == 4)
		{
			distanceDivisor = 37;
		}
		else if (iteration == 5)
		{
			distanceDivisor = 85;
		}		
		return distance / distanceDivisor;
	}
}


class Koch7DistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		float distanceDivisor = 1;
		if (iteration == 1)
		{
			distanceDivisor = 3;
		}
		else if (iteration == 2)
		{
			distanceDivisor = 7;
		}
		else if (iteration == 3)
		{
			distanceDivisor = 17;
		}
		else if (iteration == 4)
		{
			distanceDivisor = 37;
		}
		else if (iteration == 5)
		{
			distanceDivisor = 87;
		}		
		return distance / distanceDivisor;
	}
}


class Koch9DistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		return distance / (pow(5, iteration));
	}
}


class KochLakesAndIslandsDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		return distance / (pow(6, iteration - 1));
	}
}


class GosperDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		float distanceDivisor = 1;
		if (iteration == 2)
		{
			distanceDivisor = 3;
		}
		else if (iteration == 3)
		{
			distanceDivisor = 8;
		}
		else if (iteration == 4)
		{
			distanceDivisor = 21;
		}
		else if (iteration == 5)
		{
			distanceDivisor = 55;
		}
		return distance / distanceDivisor;
	}
}


class HilbertDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		return distance / (pow(2, iteration) - 1);
	}
}


class MooreDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		if (iteration > 0)
		{
			distance = distance / (pow(2, iteration + 1) - 1);
		}
		return distance;
	}
}


class PeanoDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		if (iteration > 0)
		{
			distance = distance / (pow(3, iteration) - 1);
		}
		return distance;
	}
}


class SierpinskiDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		return (distance - 100) / pow(2, iteration);
	}
}


class DavidTourDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		return (distance - 100) / (pow(2, iteration) * 3);
	}
}


class DragonDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		float distanceDivisor = 1;
		int power = 0;
		for (int i = 0; i < iteration - 1; i++)
		{
			distanceDivisor += pow(2, power);
			if (i % 2 != 0) 
			{		
				power++;	
			}
		}
		return distance / distanceDivisor;
	}
}


class TerDragonDistanceReduction 
	implements DistanceReduction
{
	float reduce(int iteration, float distance)
	{
		float distanceDivisor = 1;
		if (iteration == 1)
		{
			distanceDivisor = 1.5;
		}
		else if (iteration == 2)
		{
			distanceDivisor = 3;
		}
		else if (iteration == 3)
		{
			distanceDivisor = 6;
		}
		else if (iteration == 4)
		{
			distanceDivisor = 7.5;
		}
		else if (iteration == 5)
		{
			distanceDivisor = 16.5;
		}
		else if (iteration == 6)
		{
			distanceDivisor = 30;
		}
		else if (iteration == 7)
		{
			distanceDivisor = 44;
		}
		else if (iteration == 8)
		{
			distanceDivisor = 88;
		}
		else if (iteration == 9)
		{
			distanceDivisor = 160;
		}				
		return distance / distanceDivisor;
	}
}


interface DistanceReduction 
{
	float reduce(int iteration, float distance);
}


class D0LSystem 
{
	/*
	 * Alphabet Variables  
	 * The set of symbols containing elements that can be replaced.
	 */
	Map<String, String> variables;


	/*
	 * Symbol Constants
	 * The set of symbols containing elements that remain fixed.
	 */
	Map<String, String> symbols;


	/*
	 * Axiom
	 * The string of symbols from V defining the initial state of the system.
	 */
	String axiom;


	/*
	 * Production Rules
	 * Defines the way alphabet variables can be replaced with combinations 
	 * of constants and other variables.  
	 */
	Map<String, String> productionRules;


	/*
	 * Describing String
	 * The string sequence produced after applying the production rules.
	 */
	String descriptionString;


	/*
	 * Index into the descriptionString
	 * The index used to track the location on the descriptionString to show next.
	 */
	int descriptionStringCurrentIndex;


	/*
	 * The stroke weight used for draw
	 */
	float strokeWeight;


	/*
	 * The stroke color used for draw
	 */
	color strokeColor;


    /*
     * The point where to start the LSystem production
     */
	PVector[] startLocation;


	/*
	 * The class that holds the distance reduce method for this LSystem
	 */
	DistanceReduction distanceReduction;


	/*
	 * Iteration
	 * The number of iterations to generate.
	 */
	int iteration;


	/*
	 * The minimum iteration for this LSystem
	 */
	int minIteration;


	/*
	 * The maximum iteration for this LSystem
	 */
	int maxIteration;


	/*
	 * The current number of DRAW_FORWARD commands processed
	 */
	int currentProgress;


	/*
	 * The total number of DRAW_FORWARD commands in the descriptionString
	 */
	int totalProgress;


	/*
	 * Turtle svg used to show progress
	 */
	PShape turtle;


	/*
	 * The size of the turtle shape
	 */
	float turtleSize;	


	/*
	 * If true the LSystem will display the turtle at the end of each forward step
	 */
	boolean isTurtleOn;		


	/*
	 * If true the LSystem will display each individual forward step
	 */
	boolean isShowLSytemInProgress;	


	/*
	 * If true the LSystem will be displayed in black and white
	 */
	boolean isBlackAndWhite;	


	/*
	 * If true the LSystem will be displayed with color progression
	 */
	boolean isProgressColoring;


	/*
	 * If true the LSystem will be displayed with color progression grayscale
	 */
	boolean isProgressColoringGrayscale;


	/*
	 * If true the LSystem will be displayed with color progression alpha
	 */
	boolean isProgressColoringAlpha;


	/*
	 * The translate X value before the LSystem is shown
	 */	
	float moveInX = 0.0;


	/*
	 * The translate Y value before the LSytem is shown
	 */	
	float moveInY = 0.0;


	/*
	 * The scale value for this LSystem
	 */	
	float scalar = 1.0;


	/*
	 * The direction reverse boolean toggles a direction reverse on and off
	 */
	boolean isDirectionReverse;
	
	 
	D0LSystem(
		Map<String, String> variables, 
		Map<String, String> symbols, 
		String axiom, 
		Map<String, String> productionRules, 
		float strokeWeight,
		color strokeColor,
		PVector[] startLocation,
		DistanceReduction distanceReduction,
		int iteration,
		int minIteration,
		int maxIteration,
		PShape turtle,
		float turtleSize,
		boolean isTurtleOn,
		boolean isBlackAndWhite,
		boolean isProgressColoring,
		boolean isProgressColoringGrayscale,
		boolean isProgressColoringAlpha)
	{
		this.variables = variables;
		this.symbols = symbols;
		this.axiom = axiom;
		this.productionRules = productionRules;
		this.strokeWeight = strokeWeight;
		this.strokeColor = strokeColor;
		this.startLocation = startLocation;
		this.distanceReduction = distanceReduction;
		this.iteration = iteration;
		this.minIteration = minIteration;
		this.maxIteration = maxIteration;
		this.turtle = turtle;
		this.turtleSize = turtleSize;
		this.isTurtleOn = isTurtleOn;
		this.isBlackAndWhite = isBlackAndWhite;
		this.isProgressColoring = isProgressColoring;
		this.isProgressColoringGrayscale = isProgressColoringGrayscale;
		this.isProgressColoringAlpha = isProgressColoringAlpha;
	}


	void generate()
	{
		descriptionString = axiom;
		for(int n = 0; n < iteration; n++)
		{
			iterate();	
		}	
		descriptionStringCurrentIndex = descriptionString.length() - 1;
		calculateTotalProgress();
		isDirectionReverse = false;
	}


	void nextIteration()
	{
		if (iteration < maxIteration)
		{ 
			iteration++;
			generate();
		}
	}


	void previousIteration()
	{
		if (iteration > minIteration)
		{
			iteration--;
			generate();
		}
	}


	void calculateTotalProgress()
	{
		totalProgress = 0;
		for (int index = 0; index <= descriptionStringCurrentIndex; index++)
		{
			String instruction = null;
			String nextCharString = Character.toString(descriptionString.charAt(index));
			
			if (variables.containsKey(nextCharString))
			{
				instruction = variables.get(nextCharString);
			}
			else if (symbols.containsKey(nextCharString))
			{
				instruction = symbols.get(nextCharString);
			}
			
			if (instruction != null)
			{
				if (instruction.contains("DRAW_FORWARD"))
				{
					totalProgress++;	
				}
			}
		}		
	}


    void iterate()
	{
		StringBuilder descriptionStringBuilder = new StringBuilder(); 
		
		for (int index = 0; index < descriptionString.length(); index++)
		{
			String nextCharString = Character.toString(descriptionString.charAt(index));
			if (productionRules.containsKey(nextCharString))
			{
				descriptionStringBuilder.append(productionRules.get(nextCharString));
			}
			else 
			{
				descriptionStringBuilder.append(nextCharString);
			}
		}
		
		descriptionString = descriptionStringBuilder.toString();
	}


	void show()
	{
		currentProgress = 0;
		translate(startLocation[iteration].x + moveInX, startLocation[iteration].y + moveInY);
  		scale(scalar);
  		
		for (int index = 0; index <= descriptionStringCurrentIndex; index++)
		{
			String instruction = null;
			String nextCharString = Character.toString(descriptionString.charAt(index));
			
			if (variables.containsKey(nextCharString))
			{
				instruction = variables.get(nextCharString);
			}
			else if (symbols.containsKey(nextCharString))
			{
				instruction = symbols.get(nextCharString);
			}
			
			if (instruction != null)
			{
				process(instruction, scalar);
			}
		}
		
		if (descriptionStringCurrentIndex + 1 < descriptionString.length())
		{
			descriptionStringCurrentIndex++;
			calculateTotalProgress();
		}
	}


	void process(String instruction, float scalar)
	{
		if (instruction.contains("DRAW_FORWARD"))
		{
			currentProgress++;
			String[] instructionSplit  = instruction.split(" ");
			float drawDistance = distanceReduction.reduce(iteration, Float.parseFloat(instructionSplit[1]));	
			stroke(drawColor(), drawAlpha());
			strokeWeight(strokeWeight / scalar);
			line(0, 0, drawDistance, 0);
			translate(drawDistance, 0);
			if(isTurtleOn && (currentProgress == totalProgress))
			{
				shape(turtle, turtleSize / -8f, turtleSize / -2f, turtleSize, turtleSize);
			}
		}
		else if (instruction.contains("MOVE_FORWARD"))
		{
			String[] instructionSplit  = instruction.split(" ");
			float moveDistance = distanceReduction.reduce(iteration, Float.parseFloat(instructionSplit[1]));	
			translate(moveDistance, 0);
		}
		else if (instruction.contains("REVERSE_DIRECTIONS"))
		{
			if(isDirectionReverse)
			{
				isDirectionReverse = false;
			}
			else 
			{
				isDirectionReverse = true;
			}
		}
		else if (instruction.contains("TURN_RIGHT"))
		{
			String[] instructionSplit  = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			if (isDirectionReverse)
			{
				rotate(-radians(turnAngle));
			}
			else
			{
				rotate(radians(turnAngle));
			}
		}
		else if (instruction.contains("TURN_LEFT"))
		{
			String[] instructionSplit  = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			if (isDirectionReverse)
			{
				rotate(radians(turnAngle));
			}
			else
			{
				rotate(-radians(turnAngle));
			}
		}		
		else if (instruction.contains("SAVE_POSITION_AND_ANGLE"))
		{
			pushMatrix();
		}
		else if (instruction.contains("RESTORE_POSITION_AND_ANGLE"))
		{
			popMatrix();
		}				
	}


	color drawColor()
	{
		color drawColor = strokeColor;
		
		if(isProgressColoring)
		{
			int TOTAL_NUMBER_OF_HSB_COLORS = 360;
			int progressiveStrokeColor = int(map(currentProgress, 0, totalProgress, 0, TOTAL_NUMBER_OF_HSB_COLORS));
			colorMode(HSB, 360, 100, 100);
			drawColor = color(progressiveStrokeColor, 100, 100);
		}
		else if(isProgressColoringGrayscale)
		{
			int TOTAL_NUMBER_OF_GRAYSCALE_COLORS = 255;
			int ALPHA_NUMBER = 0xFF000000;
			int progressiveStrokeColorGrayscale = int(map(currentProgress, 0, totalProgress, 0, TOTAL_NUMBER_OF_GRAYSCALE_COLORS));
			drawColor = color(progressiveStrokeColorGrayscale);
		}
		else if(isBlackAndWhite)
		{
			drawColor = color(0);
		}
		
		return drawColor;
	}


	int drawAlpha()
	{
		int drawAlpha = 255;
		if(isProgressColoringAlpha)
		{
			int TOTAL_NUMBER_OF_ALPHA = 255;
			drawAlpha = int(map(currentProgress, 0, totalProgress, 0, TOTAL_NUMBER_OF_ALPHA));
		}
		return drawAlpha;		
	}		


	float getStrokeWeight()
	{
		return strokeWeight;
	}


	void setStrokeWeight(float strokeWeight)
	{
		this.strokeWeight = strokeWeight;		
	}


	int getStrokeColor()
	{
		return strokeColor;
	}


	void setStrokeColor(int strokeColor)
	{
		this.strokeColor = strokeColor;
	}


	void setStartLocation(PVector[] startLocation)
	{
		this.startLocation = startLocation;
	}


	PVector[] getStartLocation()
	{
		return startLocation;
	}


	boolean isTurtleOn()
	{
		return isTurtleOn;
	}


	void setTurtleOn(boolean isTurtleOn)
	{
		this.isTurtleOn = isTurtleOn;
	}


	float getTurtleSize()
	{
		return turtleSize;
	}


	void setTurtleSize(float turtleSize)
	{
		this.turtleSize = turtleSize;
	}


	boolean isShowLSytemInProgress()
	{
		return isShowLSytemInProgress;
	}


	void setShowLSytemInProgress(boolean isShowLSytemInProgress)
	{
		this.isShowLSytemInProgress = isShowLSytemInProgress;
		if (isShowLSytemInProgress)
		{
			descriptionStringCurrentIndex = 0;
		}
		else
		{
			descriptionStringCurrentIndex = descriptionString.length() - 1;
		}
		calculateTotalProgress();
	}


	boolean isBlackAndWhite()
	{
		return isBlackAndWhite;
	}


	void setBlackAndWhite(boolean isBlackAndWhite)
	{
		this.isBlackAndWhite = isBlackAndWhite;
	}	


	boolean isProgressColoring()
	{
		return isProgressColoring;
	}


	void setProgressColoring(boolean isProgressColoring)
	{
		this.isProgressColoring = isProgressColoring;
	}


	boolean isProgressColoringGrayscale()
	{
		return isProgressColoringGrayscale;
	}


	void setProgressColoringGrayscale(boolean isProgressColoringGrayscale)
	{
		this.isProgressColoringGrayscale = isProgressColoringGrayscale;
	}


	boolean isProgressColoringAlpha()
	{
		return isProgressColoringAlpha;
	}


	void setProgressColoringAlpha(boolean isProgressColoringAlpha)
	{
		this.isProgressColoringAlpha = isProgressColoringAlpha;
	}


	float getMoveInX()
	{
		return moveInX;
	}


	void setMoveInX(float moveInX)
	{
		this.moveInX = moveInX;
	}


	float getMoveInY()
	{
		return moveInY;
	}


	void setMoveInY(float moveInY)
	{
		this.moveInY = moveInY;
	}	


	float getScalar()
	{
		return scalar;
	}


	void setScalar(float scalar)
	{
		this.scalar = scalar;
	}


	int getIteration()
	{
		return iteration;
	}


	void setIteration(int iteration)
	{
		this.iteration = iteration;
		generate();
	}


	int getMinIteration()
	{
		return minIteration;
	}


	int getMaxIteration()
	{
		return maxIteration;
	}
}

