Add-Type @"
using System;
using System.Net.NetworkInformation;

public class NetworkMonitor
{
    public static void Main()
    {
        NetworkChange.NetworkAvailabilityChanged += new NetworkAvailabilityChangedEventHandler(NetworkChange_NetworkAvailabilityChanged);
        // To keep the application running
        while (true) { }
    }

    static void NetworkChange_NetworkAvailabilityChanged(object sender, NetworkAvailabilityEventArgs e)
    {
        if (e.IsAvailable)
        {
            // Write-Output "The PC is connected to the internet." # Commented out to avoid continuous output
        }
        else
        {
            Console.WriteLine("The PC is disconnected from the internet.");
        }
    }
}
"@ > NetworkMonitor.cs

csc NetworkMonitor.cs
.\NetworkMonitor.exe

