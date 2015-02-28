
import controlP5.*;

/**
 * ************************************************
 * Universidade Federal do Rio de Janeiro - COPPE
 * Tecnicas de Visualização por Computador
 * Professor: Cláudio Esperança
 * Alunos: 	Ana Goldenberg
 * 		Flavia Lofiego
 * 		Thiago Figueiredo
 **************************************************
 * Classe responsável pela criação e manipulação dos botões da Top Bar
 * 
 */

public class MyButton {
	Button butControl;
	PuzzleXML puzzleXML;
	PFont pfont, pfont1;
	ControlFont font;
	ControlP5 controlP5;
	PVector origin;
	int width, height;
	int index;
	String hintString;
	
/* Constructor que estabelece algumas particularidades de acordo com a função do botão */

	public MyButton(int pos, int x, int y, String name, PuzzleXML pxml, ControlP5 cp5) {
		puzzleXML = pxml;
		controlP5 = cp5;
		pfont = createFont(PFont.list()[puzzleXML.FONTNO],puzzleXML.FONTSIZE,true); //cria font a ser utilizada
		pfont1 = createFont(PFont.list()[109],13,true); //cria font a ser utilizada
		font = new ControlFont(pfont);
		width = puzzleXML.BUTW;
		index = pos;
		
		if (pos < 3) { 
			butControl = createBut(x, y, name, puzzleXML.BUTW,puzzleXML.BUTH);
			height = puzzleXML.BUTH;
			if (pos == 0) hintString = "\nClick here to restart the puzzle";
			if (pos == 1) hintString = "Click here if you want hints \nIt will make the game easier by\nhighlighting neighbouring pieces";
			if (pos == 2) hintString = "\nClick here to finish the puzzle";
			origin = new PVector(x,y);
		} else {
			if (pos == 3) {
				butControl = createBut(x, y, name, puzzleXML.BUTW,puzzleXML.BUTH/2);
				butControl.setColorCaptionLabel(color(80,130,160));
				butControl.setColorBackground(color(250,250,10));
				height = puzzleXML.BUTH/2;
				origin = new PVector(x,y);
				hintString = "Click here if you want to\nbreak image in 12 pieces";
			} else
				if (pos == 4) {
					butControl = createBut(x, y+2+(puzzleXML.BUTH/2), name, puzzleXML.BUTW,puzzleXML.BUTH/2);
					origin = new PVector(x,y+2+(puzzleXML.BUTH/2));
					height = puzzleXML.BUTH/2;
					hintString = "Click here if you want to\nbreak image in 48 pieces";
				}
		}
	}

/* cria o botão genérico */
	
	public Button createBut(int newX, int newY, String butName, int w, int h) {
		Button b;
		b = controlP5.addButton(butName, 0.f, newX, newY, w, h);
		b.captionLabel().setControlFont(font);
		b.captionLabel().style().padding(0, floor((w - b.captionLabel().width())/2),0,0);
		b.captionLabel().setControlFontSize(puzzleXML.FONTSIZE);
		b.captionLabel().toUpperCase(false);
		b.setColorBackground(color(80,130,160));
		b.setColorForeground(color(10,200,250));
		b.setColorCaptionLabel(color(250,250,10));
		return b;
	}
	
	public void setBackColor(int c) {
			butControl.setColorBackground(c);
	}

        public void setLabel(String label) {
          butControl.setLabel(label);
        }
	
	public void setLabelColor(int c) {
			butControl.setColorCaptionLabel(c);		
	}
	
	public boolean isInside(int x, int y) {
            if (origin != null) {
		int xEnd = (int) (origin.x) + width;
		int yEnd = (int) (origin.y) + height;
		return ((x > origin.x) && (x < xEnd) && (y > origin.y) && (y < yEnd));
            } else return false;
	}


/* desenha as elipses contendo as "clues" de cada botão */	
	public void drawEllipse() {
		smooth();
		noStroke();
		fill(color(10,200,250));
		textFont(pfont1, 13);
		if (index < 3) {
			ellipseMode(PConstants.CENTER);
			ellipse(origin.x + (width/2), (origin.y+height)+(1.0f * height), width*3.4f, height*2.0f);
			fill(0);
			text(hintString, origin.x - (width/2), origin.y + (height * 1.5f) );
		}
		else 
		{	
			ellipseMode(PConstants.CORNER);
			ellipse(origin.x+width, origin.y, width*3.0f, height*4.0f);
			fill(0);
			text(hintString, origin.x+(1.5f*width), origin.y + (height * 1.5f) );
		}
		
	}
}






