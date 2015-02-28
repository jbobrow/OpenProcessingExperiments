
// A Sierpinski arrowhead curve built with an L-system.  Click to start again.
// http://en.wikipedia.org/wiki/L-system 

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int SPACER = 10;
final float SKETCH_HEIGHT = 700;
final float SKETCH_WIDTH = ((SKETCH_HEIGHT - (SPACER * 2)) * (2f / sqrt(3))) + (SPACER * 2);
final float STROKE_WEIGHT = 8f;
final int BACKGROUND_COLOR = 0xFFFFF9F9;
final int FRAME_RATE = 1;


void setup()
{
    size(int(SKETCH_WIDTH), int(SKETCH_HEIGHT));
    background(BACKGROUND_COLOR);
    smooth();
    noFill();
    frameRate(FRAME_RATE);
    grow(1);
}
	
	
void grow(int generation)
{
	background(BACKGROUND_COLOR);
	
	float growLength = width - (SPACER * 2);
	
	if(generation > 0)
	{ 
		growLength = (width - (SPACER * 2)) / pow(2, generation);
	}
		
	Map<String, String> variables = new HashMap<String, String>();
	variables.put("F", "DRAW_FORWARD " + growLength);

	Map<String, String> symbols = new HashMap<String, String>();
	symbols.put("+", "TURN_RIGHT 60");
	symbols.put("-", "TURN_LEFT 60");

	String axiom = "XF";
	
	Map<String, List<String>> productionRules = new HashMap<String, List<String>>();
	
	List<String> rulesX = new ArrayList<String>();
	String ruleX = "YF+XF+Y";
	rulesX.add(ruleX);
	productionRules.put("X", rulesX);
	
 	List<String> rulesY = new ArrayList<String>();
	String ruleY = "XF-YF-X";
	rulesY.add(ruleY);
	productionRules.put("Y", rulesY);
	
	if (generation % 2 != 0)
	{
		translate(SPACER, SPACER);
	}
	else 
	{
		translate(SPACER, height - SPACER);
	}
	stroke(255, 0, 0);
	strokeWeight(STROKE_WEIGHT / (generation + 1));
	LSystem kochCurve = new LSystem(variables, symbols, axiom, productionRules);
	kochCurve.generate(generation);
	kochCurve.show();
}


void draw()
{	
    grow(frameCount % 9);
    if(frameCount == 8)
    {
        noLoop();
    }
}


void mousePressed() 
{
    frameCount = 1;
    loop();
}


class LSystem 
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
	Map<String, List<String>> productionRules;
	
	/*
	 * Describing String
	 * The string sequence produced after applying the production rules.
	 */
	String descriptionString;
	
	
	LSystem(Map<String, String> variables, Map<String, String> symbols, String axiom, Map<String, List<String>> productionRules)
	{
		this.variables = variables;
		this.symbols = symbols;
		this.axiom = axiom;
		this.productionRules = productionRules;
	}
	
	
	void generate(int iteration)
	{
		descriptionString = axiom;
		for(int n = 0; n < iteration; n++)
		{
			iterate();	
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
				List<String> rules = productionRules.get(nextCharString);
				for (String rule : rules)
				{
					descriptionStringBuilder.append(rule);
				}
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
		for (int index = 0; index < descriptionString.length(); index++)
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
				process(instruction);
			}
		}
	}
	
	
	void process(String instruction)
	{
		if (instruction.contains("DRAW_FORWARD"))
		{
			String[] instructionSplit  = instruction.split(" ");
			float drawDistance = Float.parseFloat(instructionSplit[1]);	
			line(0, 0, drawDistance, 0);
			translate(drawDistance, 0);
		}
		else if (instruction.contains("MOVE_FORWARD"))
		{
			String[] instructionSplit  = instruction.split(" ");
			float moveDistance = Float.parseFloat(instructionSplit[1]);	
			translate(moveDistance, 0);
		}		
		else if (instruction.contains("TURN_RIGHT"))
		{
			String[] instructionSplit  = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotate(radians(turnAngle));
		}
		else if (instruction.contains("TURN_LEFT"))
		{
			String[] instructionSplit  = instruction.split(" ");
			float turnAngle = Float.parseFloat(instructionSplit[1]);	
			rotate(-radians(turnAngle));
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
}

