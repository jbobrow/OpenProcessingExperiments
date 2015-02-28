
BookTester b;

void setup()
{
	b = new BookTester("lorem.txt");
size(600,500);
}

void draw()
{
	b.showLines();
	b.splitLines();
	noLoop();
}


