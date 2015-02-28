

public class Circulo implements FiguraInterface {

	private int tamanho;
	private int px;
	private int py;
        private Cor cor;

	public Circulo(int tamanho, int px, int py,Cor cor ) {
		this.tamanho = tamanho;
		this.px = px;
		this.py = py;
                this.cor = cor;
	}
	public void setCor(Cor cor) {
		this.cor = cor;
	}
	
	public boolean isPointIn(int x, int y) {
		float disX = px - x;
		float disY = py - y;
		return (PApplet.sqrt(PApplet.sq(disX) + PApplet.sq(disY)) < tamanho / 2);

	}

	public void draw(PApplet applet) {
                applet.strokeWeight(1);
                stroke(1);
                cor.draw (applet);
		applet.ellipse(px, py, tamanho, tamanho);
                noStroke();
		

	}

}


