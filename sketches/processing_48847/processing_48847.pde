
// 3-D Hilbert Curve   
// Use the mouse to move, rotate, and zoom.
// Press "n" for the next iteration.  Press "p" for the previous iteration.
// Press "+" to increase the size of the curve.  Press "-" to decrease the size of the curve.
// Press "r" to toggle the show rendering of the curve.
// Press "t" to toggle the curve between rectangular and tube like.
// Press "g" to toggle a grid off and on.
// Press "b" to toggle the boxes off and on.
// Press "a" to toggle the show all iterations off and on.
// http://en.wikipedia.org/wiki/Hilbert_curve
// Mouse driven camera movements provided by the PeasyCam library.

// (c) David Balash 2012
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

import peasy.*;
import shapes3d.*;


final int SKETCH_WIDTH = 750;
final int SKETCH_HEIGHT = 750;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int FRAME_RATE = 500;
final int CAMERA_DISTANCE = 450;
final float INITIAL_ROTATION_X = -0.5;
final float INITIAL_ROTATION_Y = -0.5;

PeasyCam camera;
PMatrix baseMatrix; 
List<D0LSystem> lSystemList = new ArrayList<D0LSystem>();
int lSystemListIndex = 0;
boolean toggleGrid = false;
boolean toggleBoxes = true;
boolean toggleTube = false;
boolean toggleShowAll = false;
boolean toggleRender = false;
Tube tube = new Tube(this, 6, 12);


void setup()
{
    size(SKETCH_WIDTH, SKETCH_HEIGHT, P3D);
    baseMatrix = g.getMatrix();
    background(BACKGROUND_COLOR);
    noStroke();
	frameRate(FRAME_RATE);
	lSystemInitialization();
	lSystemList.get(0).generate();
	lSystemList.get(1).generate();
	lSystemList.get(2).generate();
	lSystemList.get(3).generate();
	camera = new PeasyCam(this, width / 5, height / 7, 0, CAMERA_DISTANCE);
}	


void draw()
{	
	rotateX(INITIAL_ROTATION_X);
 	rotateY(INITIAL_ROTATION_Y);
	background(BACKGROUND_COLOR);
	pushMatrix();  
	g.setMatrix(baseMatrix);	
	directionalLight(130, 130, 130, -1, 0, 0);
	directionalLight(90, 90, 90, 0, 0, -1);
	popMatrix();
	ambientLight(155, 155, 155);
	boolean iterationReduction;
	
	if (toggleShowAll)
	{
		iterationReduction = false;
		lSystemList.get(1).show(iterationReduction, toggleBoxes, toggleGrid, toggleTube);
		lSystemList.get(2).show(iterationReduction, toggleBoxes, toggleGrid, toggleTube);
		lSystemList.get(3).show(iterationReduction, toggleBoxes, toggleGrid, toggleTube);
	}
	else 
	{
		iterationReduction = true;
		lSystemList.get(lSystemListIndex).show(iterationReduction, toggleBoxes, toggleGrid, toggleTube);
	}
}


void keyPressed() 
{
	if (key == 'n')
	{
		lSystemList.get(lSystemListIndex).nextIteration();
	}
	else if (key == 'p')
	{
		lSystemList.get(lSystemListIndex).previousIteration();
	}
	else if (key == '+')
	{
		float currentDrawSize = lSystemList.get(lSystemListIndex).getDrawSize();
		currentDrawSize += 0.5;
		lSystemList.get(lSystemListIndex).setDrawSize(currentDrawSize);
	}
	else if (key == '-')
	{
		float currentDrawSize = lSystemList.get(lSystemListIndex).getDrawSize();
		currentDrawSize -= 0.5;
		if (currentDrawSize > 0)
		{
			lSystemList.get(lSystemListIndex).setDrawSize(currentDrawSize);
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

		lSystemList.get(lSystemListIndex).render(toggleRender);
	}
	else if (key == 't')
	{
		if(toggleTube)
		{
			toggleTube = false;
		}
		else 
		{
			toggleTube = true;
		} 
	}	
	else if (key == 'g')
	{
		if(toggleGrid)
		{
			toggleGrid = false;
		}
		else 
		{
			toggleGrid = true;
		} 
	}
	else if (key == 'b')
	{
		if(toggleBoxes)
		{
			toggleBoxes = false;
		}
		else 
		{
			toggleBoxes = true;
		} 
	}
	else if (key == 'a')
	{
		if(toggleShowAll)
		{
			toggleShowAll = false;
		}
		else 
		{
			toggleShowAll = true;
		} 
	}	
}


void lSystemInitialization()
{
	Map variables = new HashMap<String, String>();
	Map symbols = new HashMap<String, String>();
	String axiom;
	Map productionRules = new HashMap<String, String>();
	int iteration;
	float drawSize;
	int fillColor;
	PVector startLocation;
	int HILBERT_COLOR;
	
	
	// Hilbert 0
	HILBERT_COLOR = 0XFF5959AB;
	variables = new HashMap<String, String>();
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 154");
	symbols.put("A", "DRAW_CUBE_A 154");
	symbols.put("B", "DRAW_CUBE_B 154");	
	symbols.put("C", "DRAW_CUBE_C 154");	
	symbols.put("D", "DRAW_CUBE_D 154");		
	symbols.put("+", "TURN_LEFT 90");
	symbols.put("-", "TURN_RIGHT 90");
	symbols.put("&", "PITCH_DOWN 90");
	symbols.put("^", "PITCH_UP 90");
	symbols.put("\\", "ROLL_LEFT 90");
	symbols.put("/", "ROLL_RIGHT 90");
	symbols.put("|", "TURN_AROUND");
	
	axiom = "A";
	
	productionRules = new HashMap<String, String>();
	productionRules.put("A", "B-F+CFC+F-D&F^D-F+&&CFC+F+B//");
	productionRules.put("B", "A&F^CFB^F^D^^-F-D^|F^B|FC^F^A//");	
	productionRules.put("C", "|D^|F^B-F+C^F^A&&FA&F^C+F+B^F^D//");	
	productionRules.put("D", "|CFB-F+B|FA&F^A&&FB-F+B|FC//");		
	
	iteration = 3;
	
	fillColor = HILBERT_COLOR;
	drawSize = 2.9;
	
	startLocation = new PVector(290, 100, 0);
	
	lSystemList.add(
		new D0LSystem(
			variables, 
			symbols, 
			axiom, 
			productionRules, 
			iteration, 
			drawSize, 
			fillColor, 
			startLocation));
	

	// Hilbert 1
	HILBERT_COLOR = 0xFF871F78; 
	variables = new HashMap<String, String>();
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 88");
	symbols.put("A", "DRAW_CUBE_A 88");
	symbols.put("B", "DRAW_CUBE_B 88");	
	symbols.put("C", "DRAW_CUBE_C 88");	
	symbols.put("D", "DRAW_CUBE_D 88");	
	symbols.put("+", "TURN_LEFT 90");
	symbols.put("-", "TURN_RIGHT 90");
	symbols.put("&", "PITCH_DOWN 90");
	symbols.put("^", "PITCH_UP 90");
	symbols.put("\\", "ROLL_LEFT 90");
	symbols.put("/", "ROLL_RIGHT 90");
	symbols.put("|", "TURN_AROUND");	
	
	iteration = 1;
	
	fillColor = HILBERT_COLOR;
	drawSize = 2.9;
	
	startLocation = new PVector(257, 67, 33);
	
	lSystemList.add(
		new D0LSystem(
			variables, 
			symbols, 
			axiom, 
			productionRules, 
			iteration, 
			drawSize, 
			fillColor, 
			startLocation));
	
	
	// Hilbert 2		
	HILBERT_COLOR = 0xFFFF7F00;
	variables = new HashMap<String, String>();
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 44");
	symbols.put("A", "DRAW_CUBE_A 44");
	symbols.put("B", "DRAW_CUBE_B 44");	
	symbols.put("C", "DRAW_CUBE_C 44");	
	symbols.put("D", "DRAW_CUBE_D 44");	
	symbols.put("+", "TURN_LEFT 90");
	symbols.put("-", "TURN_RIGHT 90");
	symbols.put("&", "PITCH_DOWN 90");
	symbols.put("^", "PITCH_UP 90");
	symbols.put("\\", "ROLL_LEFT 90");
	symbols.put("/", "ROLL_RIGHT 90");
	symbols.put("|", "TURN_AROUND");	
	
	iteration = 2;
	
	fillColor = HILBERT_COLOR;
	drawSize = 2.9;
	
	startLocation = new PVector(279, 89, 11);
	
	lSystemList.add(
		new D0LSystem(
			variables, 
			symbols, 
			axiom, 
			productionRules, 
			iteration, 
			drawSize, 
			fillColor, 
			startLocation));
		
		
	// Hilbert 3		
	HILBERT_COLOR = 0XFF5959AB;
	variables = new HashMap<String, String>();
	
	symbols = new HashMap<String, String>();
	symbols.put("F", "DRAW_FORWARD 22");
	symbols.put("A", "DRAW_CUBE_A 22");
	symbols.put("B", "DRAW_CUBE_B 22");	
	symbols.put("C", "DRAW_CUBE_C 22");	
	symbols.put("D", "DRAW_CUBE_D 22");	
	symbols.put("+", "TURN_LEFT 90");
	symbols.put("-", "TURN_RIGHT 90");
	symbols.put("&", "PITCH_DOWN 90");
	symbols.put("^", "PITCH_UP 90");
	symbols.put("\\", "ROLL_LEFT 90");
	symbols.put("/", "ROLL_RIGHT 90");
	symbols.put("|", "TURN_AROUND");
	
	iteration = 3;
	
	fillColor = HILBERT_COLOR;
	drawSize = 2.9;
	
	startLocation = new PVector(290, 100, 0);
	
	lSystemList.add(
		new D0LSystem(
			variables, 
			symbols, 
			axiom, 
			productionRules, 
			iteration, 
			drawSize, 
			fillColor, 
			startLocation));				
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
	 * Iteration
	 * The number of iterations to generate.
	 */
	int iteration;
	
	/*
	 * The width of the tube used to draw
	 */
	float drawSize;
	
	/*
	 * The fill color
	 */
	int fillColor;

    /*
     * The point where to start the LSystem production
     */
	PVector startLocation;

	
	D0LSystem(
		Map<String, String> variables, 
		Map<String, String> symbols, 
		String axiom, 
		Map<String, String> productionRules, 
		int iteration,
		float drawSize,
		int fillColor,
		PVector startLocation)
	{
		this.variables = variables;
		this.symbols = symbols;
		this.axiom = axiom;
		this.productionRules = productionRules;
		this.iteration = iteration;
		this.drawSize = drawSize;
		this.fillColor = fillColor;
		this.startLocation = startLocation;
	}
	
	
	void generate()
	{
		descriptionString = axiom;
		for(int n = 0; n < iteration; n++)
		{
			iterate();	
		}	
		descriptionStringCurrentIndex = descriptionString.length() - 1;
	}
	
	
	void nextIteration()
	{
		iteration++;
		generate();
	}


	void previousIteration()
	{
		iteration--;
		generate();
	}


	void render(boolean render)
	{
		if (render)
		{
			descriptionStringCurrentIndex = 0;
		}
		else
		{
			descriptionStringCurrentIndex = descriptionString.length() - 1;
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

	
	void show(boolean iterationReduction, boolean toggleBoxes, boolean toggleGrid, boolean toggleTube)
	{
		pushMatrix();
		translate(startLocation.x, startLocation.y, startLocation.z);
  		
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
				process(instruction, index, iterationReduction, toggleTube);
			}
			
			if (descriptionString.substring(index).startsWith(productionRules.get("A")))
			{
				processBoxesAndGrid(symbols.get("A"), iterationReduction, toggleBoxes, toggleGrid);	
			}
			else if (descriptionString.substring(index).startsWith(productionRules.get("B")))
			{
				processBoxesAndGrid(symbols.get("B"), iterationReduction, toggleBoxes, toggleGrid);	
			}
			else if (descriptionString.substring(index).startsWith(productionRules.get("C")))
			{
				processBoxesAndGrid(symbols.get("C"), iterationReduction, toggleBoxes, toggleGrid);	
			}
			else if (descriptionString.substring(index).startsWith(productionRules.get("D")))
			{
				processBoxesAndGrid(symbols.get("D"), iterationReduction, toggleBoxes, toggleGrid);	
			}			
		}
		
		if (descriptionStringCurrentIndex + 1 < descriptionString.length())
		{
			descriptionStringCurrentIndex++;
		}
		popMatrix();
	}
	
	
	void process(String instruction, int currentInstructionIndex, boolean iterationReduction, boolean toggleTube)
	{
		if (instruction.contains("DRAW_FORWARD"))
		{
			String[] instructionSplit = instruction.split(" ");
			float drawDistance = processDistance(Float.parseFloat(instructionSplit[1]), iterationReduction);	
			if (toggleTube)
			{
				tube.fill(fillColor);
				tube.fill(fillColor, Tube.BOTH_CAP);
				tube.setSize(drawSize, drawSize, drawSize, drawSize);
				tube.setWorldPos(0, 0, 0, 0, 0, drawDistance);
				tube.draw();
				fill(fillColor);
				sphere(drawSize);
				translate(0, 0, drawDistance);
				// Draw the end cap sphere
				if (descriptionString.lastIndexOf("F") == currentInstructionIndex)
				{
					sphere(drawSize);
				}
			}
			else 
			{
				fill(fillColor);
				float boxDrawSize = drawSize * 1.3333;
				// Draw the start cap box
				if (descriptionString.indexOf("F") == currentInstructionIndex)
				{
					box(boxDrawSize);
				}
				translate(0, 0, drawDistance / 2);
				box(boxDrawSize, boxDrawSize, drawDistance - boxDrawSize);
				translate(0, 0, drawDistance / 2);
				box(boxDrawSize, boxDrawSize, boxDrawSize);
			}
		}
		else if (instruction.contains("MOVE_FORWARD"))
		{
			String[] instructionSplit = instruction.split(" ");
			float moveDistance = processDistance(Float.parseFloat(instructionSplit[1]), iterationReduction);
			
			if (iterationReduction)
			{	
				moveDistance = moveDistance / (pow(2, iteration) - 1);
			}
			translate(0, 0, moveDistance);
		}
		else if (instruction.contains("TURN_LEFT"))
		{
			String[] instructionSplit = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotateY(radians(turnAngle));
		}
		else if (instruction.contains("TURN_RIGHT"))
		{
			String[] instructionSplit = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotateY(-radians(turnAngle));
		}
		else if (instruction.contains("TURN_AROUND"))
		{
			rotateY(PI);
		}		
		else if (instruction.contains("PITCH_DOWN"))
		{
			String[] instructionSplit = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotateX(radians(turnAngle));
		}
		else if (instruction.contains("PITCH_UP"))
		{
			String[] instructionSplit = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotateX(-radians(turnAngle));
		}
		else if (instruction.contains("ROLL_LEFT"))
		{
			String[] instructionSplit = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotateZ(radians(turnAngle));
		}
		else if (instruction.contains("ROLL_RIGHT"))
		{
			String[] instructionSplit = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotateZ(-radians(turnAngle));
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
	
	
	void processBoxesAndGrid(String instruction, boolean iterationReduction, boolean toggleBoxes, boolean toggleGrid)
	{
		if (instruction.contains("DRAW_CUBE_A"))
		{
			int RED = 0xFFFF0000;
			String[] instructionSplit = instruction.split(" ");
			float drawDistance = processDistance(Float.parseFloat(instructionSplit[1]), iterationReduction);
			pushMatrix();
			fill(RED);
			translate(-drawDistance / 2f, -drawDistance / 2f, drawDistance / 2f);
			processCube(drawDistance, toggleBoxes, toggleGrid);
			popMatrix();
		}
		else if (instruction.contains("DRAW_CUBE_B"))
		{
			int BLUE = 0xFF0000FF;
			String[] instructionSplit = instruction.split(" ");
			float drawDistance = processDistance(Float.parseFloat(instructionSplit[1]), iterationReduction);
			pushMatrix();
			fill(BLUE);
			translate(-drawDistance / 2f, -drawDistance / 2f, drawDistance / 2f);
			processCube(drawDistance, toggleBoxes, toggleGrid);
			popMatrix();
		}
		else if (instruction.contains("DRAW_CUBE_C"))
		{
			int GREEN = 0xFF008000;
			String[] instructionSplit = instruction.split(" ");
			float drawDistance = processDistance(Float.parseFloat(instructionSplit[1]), iterationReduction);
			pushMatrix();
			fill(GREEN);
			translate(drawDistance / 2f, -drawDistance / 2f, -drawDistance / 2f);
			processCube(drawDistance, toggleBoxes, toggleGrid);
			popMatrix();
		}
		else if (instruction.contains("DRAW_CUBE_D"))
		{
			int YELLOW = 0xFFFFFF00;
			String[] instructionSplit = instruction.split(" ");
			float drawDistance = processDistance(Float.parseFloat(instructionSplit[1]), iterationReduction);
			pushMatrix();
			fill(YELLOW);
			translate(-drawDistance / 2f, -drawDistance / 2f, drawDistance / 2f);
			processCube(drawDistance, toggleBoxes, toggleGrid);
			popMatrix();
		}		
	}
	
	
	float processDistance(float drawDistance, boolean iterationReduction)
	{
		if (iterationReduction)
		{
			drawDistance = drawDistance / (pow(2, iteration) - 1);
		}
		return drawDistance;
	}

	
	void processCube(float drawDistance, boolean toggleBoxes, boolean toggleGrid)
	{
		if (toggleBoxes)
		{
			float boxSize = drawDistance * (1 - ((iteration - 1) * 0.05));
			box(boxSize);
		}

		if (toggleGrid)
		{			
			float gridSize = drawDistance * 2f;
			translate(-gridSize / 2f, -gridSize / 2f, gridSize / 2f);
			drawGrid(gridSize);
		}		
	}


	void drawGrid(float gridSize)
	{
		float gridWeight = 1.4;
		int GRID_COLOR = 0xF1626262;
		
		pushMatrix();
		smooth();
		strokeWeight(gridWeight);
		stroke(GRID_COLOR);
		for (int i = 0; i < 4; i++)
		{
			translate(gridSize, 0, 0);
			rotateY(HALF_PI);
			pushMatrix();
			for (int j = 0; j < 3; j++)
			{
				line(0, 0, 0, gridSize, 0, 0);
				translate(gridSize, 0, 0);
				rotate(HALF_PI);
			}
			popMatrix();
		}
		noSmooth();
		noStroke();
		popMatrix();
	}

	
	float getDrawSize()
	{
		return drawSize;
	}
		
	void setDrawSize(float drawSize)
	{
		this.drawSize = drawSize;		
	}
	
	int getFillColor()
	{
		return fillColor;
	}
	
	void setFillColor(int fillColor)
	{
		this.fillColor = fillColor;
	}
	
	void setStartLocation(PVector startLocation)
	{
		this.startLocation = startLocation;
	}
	
	PVector getStartLocation()
	{
		return startLocation;
	}
}

