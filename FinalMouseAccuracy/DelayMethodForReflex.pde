void wait(int ms)  //delays to allow numbers to countdown 
{
    try
    {
        Thread.sleep(ms);
    }
    catch(InterruptedException ex)
    {
        Thread.currentThread().interrupt();
    }
    stop();
}
