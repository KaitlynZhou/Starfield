class Particle
{
  //your code here
  double myX, myY, mySpeed, myAngle;
  int myColor, x, y, x1, y2;
  Particle(){
    myX = myY = 250;
    myColor = color(120,
                    (int)(Math.random()*160)+120,
                    255);
    mySpeed = Math.random()*3.5;
    myAngle = Math.random()*2*Math.PI;
  }
  void move(){
    myX+=Math.cos(myAngle)*mySpeed;
    myY+=Math.sin(myAngle)*mySpeed;
    if(myX>500 || myX<0 || myY>500 || myY<0){
      myX = 250;
      myY = 250;
    }    
  }
  void show(){
    noStroke();
    fill(myColor);
    ellipse((float)myX, (float)myY, 5,5);
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  //your code here
  OddballParticle(){
    myX = myY = 250;
    myColor = color(#FFC124);
    mySpeed = Math.random()*2;
    myAngle = Math.random()*2*Math.PI;
    x = (int)(Math.random()*2);
    y = 0;
    x1 = 0;
    y2 = 0;
  }
  void move(){
    myX = myX + (int)(Math.random()*7)-3;
                //{-3,-2,-1,0,1,2,3}
    myY = myY + (int)(Math.random()*7)-3;
  }
  void show(){
    noStroke();
    fill(myColor);
    pushMatrix();
    if (x==0){
      y=90;
      x1= 500;}
    if (x==1){
      y=45;
      x1=250;
      y2=-100;}
    translate(x1,y2);
    rotate(radians(y));
    triangle((float)myX,(float)myY,(float)myX+25,(float)myY+50,(float)myX+50,(float)myY);
    fill(#FFF25A);
    triangle((float)myX+5,(float)myY+10,(float)myX+25,(float)myY+50,(float)myX+45,(float)myY+10);
    fill(255,0,0);
    ellipse((float)myX+17,(float)myY+20,10,10);
    ellipse((float)myX+32,(float)myY+20,10,10);
    ellipse((float)myX+25,(float)myY+37,10,10);
    popMatrix();
    if(mouseX > myX)
      myX = myX + (int)(Math.random()*5)-1;
    else
      myX = myX + (int)(Math.random()*5)-3;
    if(mouseY > myY)
      myY = myY + (int)(Math.random()*5)-1;
    else
      myY = myY + (int)(Math.random()*5)-3;
    //stroke(myColor);
    //strokeWeight(14);
    //strokeJoin(ROUND);
    //beginShape();
    //vertex((float)myX, (float)myY);
    //vertex((float)myX+12.5, (float)myY-25);
    //vertex((float)myX+25, (float)myY);
    //vertex((float)myX, (float)myY);
    //endShape();
    
    //beginShape();
    //strokeWeight(5);
    ////left bottom wing
    //vertex((float)myX, (float)myY-12.5);
    //vertex((float)myX-25,(float)myY+5);
    //vertex((float)myX, (float)myY-12.5);
    ////left top wing
    //vertex((float)myX-25, (float)myY-20);
    //vertex((float)myX,(float)myY-5);
    //vertex((float)myX, (float)myY);
    //vertex((float)myX+25, (float)myY);
    ////right bottom wing
    //vertex((float)myX+25, (float)myY-12.5);
    //vertex((float)myX+50,(float)myY+5);
    //vertex((float)myX+25, (float)myY-12.5);
    ////right top wing
    //vertex((float)myX+50, (float)myY-20);
    //vertex((float)myX+25, (float)myY-12.5);
    //endShape();  
    
    //stroke(0);
    //beginShape();
    //strokeWeight(2);
    //vertex((float)myX, (float)myY);
    //vertex((float)myX+12.5, (float)myY-25);
    //vertex((float)myX+25, (float)myY);
    //vertex((float)myX, (float)myY);
    //endShape();
    
    //beginShape();
    //strokeWeight(2);
    ////left bottom wing
    //vertex((float)myX, (float)myY-12.5);
    //vertex((float)myX-25,(float)myY+5);
    //vertex((float)myX, (float)myY-12.5);
    ////left top wing
    //vertex((float)myX-25, (float)myY-20);
    //vertex((float)myX,(float)myY-5);
    //vertex((float)myX, (float)myY);
    //vertex((float)myX+25, (float)myY);
    ////right bottom wing
    //vertex((float)myX+25, (float)myY-12.5);
    //vertex((float)myX+50,(float)myY+5);
    //vertex((float)myX+25, (float)myY-12.5);
    ////right top wing
    //vertex((float)myX+50, (float)myY-20);
    //vertex((float)myX+25, (float)myY-12.5);
    //endShape();  
}
}
//your code here

Particle [] ball;

void setup()
{
  //your code here
  size(500,500);
  ball = new Particle[250];
  for(int i = 5; i<250; i++){
    ball[i] = new Particle();
  }
  for(int i = 0; i<5; i++){
    ball[i] = new OddballParticle();
  }
}
void draw()
{
  //your code here
  fill(0,0,0,10);
  rect(0,0,500,500);
  for(int i = 0; i<ball.length; i++){
    ball[i].show();
    ball[i].move();
  }
}
