

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Random;
import java.util.Stack;
import java.util.*;

//import com.pathfinding.PathFind.square;

//calls final version of single goal maze with scores

public class PathDisplay extends PApplet{

	
	int L = 500;
	int H = 500;
	int boxSide = 40;
	int mazesize = 10;

	Point current_loc = null;
	PathFind p ;
	Maze m;
	asquare[] path ;
	
	asquare[][] scores ;
	PFont font ;
	
	public void path(){
	}
	
	
	public void setup()
	{
		size(L, H, P3D);
		background(254);
                font = loadFont("CourierNew36.vlw");
		drawGrid();
		setBoard();
		path();
		//paths = s.getPaths();
	}

	public void draw()
	{
		if( path != null && path.length != 0 )
		{
			for( int i = 0 ; i < path.length ; i++){
				asquare p = path[i];
				drawP(255,p);
			}
		}else 
		{
			print("no path ");
		}
		noLoop();
		
	}
	
	public void drawMaze(){
		for( int i = 0 ; i < mazesize ; i++ ){
			for( int j = 0 ; j < mazesize ; j++ ){
				int type = m.maze[i][j];
				switch(type){
				case 1:	//obstacles are grey
					fill( 100,100,100);
					break;
				case 2: //skies are light-grey
					fill( 200,200,200 );
					break;
				case 3://begin = blue
					fill( 0,0,255);
					break;
				case 4: //goal = green
					fill( 0,255,0);
					break;
				}
				//print( i +","+j+">--"+type+"\n");
				noStroke();
				rect( getX(i)+5,getY(j)+5,30,30);
			}
		}
	}
	
	public void mouseClicked() {
		background(255);
		drawGrid();
		setBoard();
		loop();	
	}

	public int getX(int x){
		return ( 50+(40*x) );
	}
	public int getY(int y){
		return ( 50+(40*y) );
	}
	
	
	public void setBoard(){
		m = new Maze(mazesize);
		p = new PathFind();
		scores = p.scores(m);
		drawMaze();
		putScores();
		asquare finalsq = p.getGoalSquare(m);
		ArrayList l = (ArrayList) p.getPath(finalsq, m); 
		path = (asquare[])l.toArray(new asquare[l.size()]);
		
	}	
	public void putScores(){
		for( int i = 0 ; i < mazesize ; i++ ){
			for( int j = 0 ; j < mazesize ; j++ ){
				if( m.maze[i][j] == 2 )
				{
					String score = str(scores[i][j].score);
					fill(0);
					textFont(font,10); 
					text( score, getX(i)+15, getY(j)+15 );
				}
			}
		}
	}
	public boolean contains(Stack paths2,Point p){
		Iterator ite = paths2.iterator();
		while(ite.hasNext()){
			Point p1 = (Point)ite.next();
			if( p1.equals(p))
				return true;
		}
		return false;
	}
	public void putPath(ArrayList path){
		Iterator ite = path.iterator();
		while( ite.hasNext() ){
			drawP((Point)ite.next());
		}
	}
	public void drawP(Point p){			drawP(250,p);	}	//gen path point
	public void drawP(int red,Point p){		drawP(red,0,0,p);	}	//lead point
	public void drawP(int r,int g, int b,Point p){	//generic
		fill(r,g,b);
		rect(getX(p.x)+15,getY(p.y)+15,10,10);
	}
/*
	public void setBoardMany(){
		m = ManyGoalMaze.get(mazesize);
		drawMaze();
		try
		{
			ManyPathFind p = new ManyPathFind();
			ArrayList l = (ArrayList) p.multiplePaths( (ManyGoalMaze) m );
			for( Object o :l){
				if( o != null){
					path = (PathFind.square[]) ((ArrayList)o).toArray(new PathFind.square[l.size()]);
					for( Point p1:path){
						drawP(255,p1);
					}
				}
			}
			
			
		}
		catch(Exception e){System.out.println("error occured");e.printStackTrace();}
	}
	*///100 pieces
	public void drawGrid(){
		/*for( int i = 200; i <= (boxSide*mazesize) ; i+= boxSide ){
			stroke(0);
			line(i,100,i,H-(100+(boxSide*mazesize)));
		}
		for( int i = 100; i <= (boxSide*mazesize) ; i+= boxSide ){
			stroke(0);
			line(200,i,L-(200+(boxSide*mazesize)),i);
		}*/
	}
}

