
// Conway's Game of Life B1/S12 generates four very close approximations to the Sierpinski triangle when applied to a single live cell.
// B1/S12: A cell is born if it has exactly 1 neighbors, stays alive if it has 1 or 2 living neighbors, and dies otherwise.
// Click to start again.

// (c) David Balash 2011
// Free software licensed under the Creative Commons 3.0 License
// http://creativecommons.org/licenses/by-nc-sa/3.0/
// Attribution - Noncommerical - Share Alike

final int SKETCH_WIDTH = 900;
final int SKETCH_HEIGHT = 900;
final int BACKGROUND_COLOR = 0xFFFFFFFF;
final int CELL_SIZE = 3;
final int CELL_COLOR = 0xFF000000;

Map<PVector, Cell> universe = new HashMap<PVector, Cell>();


void setup()
{ 
	size(SKETCH_WIDTH, SKETCH_HEIGHT); 
	background(BACKGROUND_COLOR);
	fill(CELL_COLOR);
	
	for (int x = 0; x < SKETCH_WIDTH; x += CELL_SIZE)
	{
		for (int y = 0; y < SKETCH_HEIGHT; y += CELL_SIZE)
		{
			CellLocation cellLocation = new CellLocation(x, y);
			universe.put(cellLocation, new Cell(cellLocation));
		}
	}
	
	for (Cell cell: universe.values())
	{
		CellLocation cellLocation = cell.getCellLocation();
		
		float above = cellLocation.y - CELL_SIZE;
		float below = cellLocation.y + CELL_SIZE;
		float left = cellLocation.x - CELL_SIZE;
		float right = cellLocation.x + CELL_SIZE;
		
		if (above < 0)
		{ 
			above = SKETCH_HEIGHT - CELL_SIZE;
		}
		
		if (below == SKETCH_HEIGHT)
		{
			below = 0;
		}
		
		if (left < 0)
		{
			left = SKETCH_WIDTH - CELL_SIZE;
		}
		
		if (right == SKETCH_WIDTH)
		{
			right = 0;
		}
		
		cell.addNeighbor(universe.get(new CellLocation(left, above)));
		cell.addNeighbor(universe.get(new CellLocation(left, below)));
		cell.addNeighbor(universe.get(new CellLocation(right, above)));
		cell.addNeighbor(universe.get(new CellLocation(right, below)));
		cell.addNeighbor(universe.get(new CellLocation(left, cellLocation.y)));
		cell.addNeighbor(universe.get(new CellLocation(right, cellLocation.y)));
		cell.addNeighbor(universe.get(new CellLocation(cellLocation.x, above)));
		cell.addNeighbor(universe.get(new CellLocation(cellLocation.x, below)));
	}
} 

 
void draw()
{ 
	for (Cell cell: universe.values())
	{
		cell.update();
	}
	
	for (Cell cell: universe.values())
	{
		cell.show();
	}
} 


void mouseClicked()
{
	setup();
}


class Cell
{
	CellLocation cellLocation;
	boolean state;
	boolean nextState;
	List<Cell> neighbors = new ArrayList<Cell>();
	
	
	Cell(CellLocation cellLocation)
	{
		this.cellLocation = cellLocation;
		initialize();
	}
	
	
	void initialize()
	{
		if ((cellLocation.x == (SKETCH_WIDTH / 2)) && (cellLocation.y == (SKETCH_HEIGHT / 2)))
		{
			nextState = true;
		}
		else
		{
			nextState = false;
		}
		
		state = nextState;
	}

	
	void addNeighbor(Cell cell)
	{
		neighbors.add(cell);
	}
	
	
	void update()
	{
		int liveNeighbors = 0;
		
		for (Cell cell: neighbors)
		{
			if (cell.isState())
			{
				liveNeighbors++;
			}
		}
		
		if (state)
		{
			if ((liveNeighbors == 1) || (liveNeighbors == 2))
			{
				nextState = true;
			}
			else
			{
				nextState = false;
			}
		}
		else
		{
			if (liveNeighbors == 1)
			{
				nextState = true;
			}
			else
			{
				nextState = false;
			}				
		}
	}
	
	
	void show()
	{
		state = nextState;
		
		if (state == true)
		{
			
			rect(cellLocation.x, cellLocation.y, CELL_SIZE, CELL_SIZE);
		}
	}
	
	
	boolean isState()
	{
		return state;
	}
	
	
	CellLocation getCellLocation()
	{
		return cellLocation;	
	}
}


class CellLocation extends PVector
{
	CellLocation(float x, float y)
	{
		super(x, y);
	}


	boolean equals(Object object)
	{
		CellLocation cellLocation = (CellLocation)object;
		boolean equals = false;
		if ((x == cellLocation.x) && (y == cellLocation.y))
		{
			equals = true;
		}
		return equals;
	}
	
	
	int hashCode() 
	{
		final int prime = 31;
		int result = 1;
		result = prime * result + Float.floatToIntBits(x);
		result = prime * result + Float.floatToIntBits(y);
		return result;
	}
}

