
class ColorIcon
{
    public String colorImgUrl;
    public int imgLocX1;
    public int imgLocY1;
    public int posX1;
    public int posY1;
    public int posX2;
    public int posY2;
    
    public ColorIcon( String imgUrl, int _imgLocX1, int _imgLocY1, int _posX1, int _posY1, int _posX2, int _posY2 )
    {
        colorImgUrl = imgUrl;
        imgLocX1 = _imgLocX1;
        imgLocY1 = _imgLocY1;
        posX1 = _posX1;
        posY1 = _posY1;
        posX2 = _posX2;
        posY2 = _posY2;
    }
    
    public String getColorImgUrl() { return colorImgUrl; }
    
    public int getImgLocX1() { return imgLocX1; }
    public void setImgLocX1( int val ) { imgLocX1 = val; }
    
    public int getImgLocY1() { return imgLocY1; }
    public void setImgLocY1( int val ) { imgLocY1 = val; }
    
    public int getPosX1() { return posX1; }
    public void setPosX1( int val ) { posX1 = val; }
    
    public int getPosY1() { return posY1; }
    public void setPosY1( int val ) { posY1 = val; }
    
    public int getPosX2() { return posX2; }
    public void setPosX2( int val ) { posX2 = val; }
    
    public int getPosY2() { return posY2; }
    public void setPosY2( int val ) { posY2 = val; }
}

