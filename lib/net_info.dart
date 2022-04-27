import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';

class NetInfo extends StatefulWidget {
  const NetInfo({Key? key}) : super(key: key);

  @override
  State<NetInfo> createState() => _NetInfoState();
}

class _NetInfoState extends State<NetInfo> {
  final info = NetworkInfo();

  String? wifiIpv6;
  String? wifiBroadcast;
  String? wifiGatewayIp;
  String? wifiSubMask;
  String? wifiIp;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Get Details"),
              onPressed: () {
                getWifiDetails();
              },
            ),
            const SizedBox(
              height: 30,
            ),
            Text("IPV6 : ${wifiIpv6 ?? ""}"),
            const SizedBox(
              height: 10,
            ),
            Text("Broadcast : ${wifiBroadcast ?? ""}"),
            const SizedBox(
              height: 10,
            ),
            Text("GatewayIp : ${wifiGatewayIp ?? ""}"),
            const SizedBox(
              height: 10,
            ),
            Text("SubnetMask : ${wifiSubMask ?? ""}"),
            const SizedBox(
              height: 10,
            ),
            Text("IPV4 : ${wifiIp ?? ""}"),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  getWifiDetails() async {
    String? kWifiIp = await info.getWifiIP();
    String? kWifiBroadcast = await info.getWifiBroadcast();
    String? kWifiGatewayIp = await info.getWifiGatewayIP();
    String? kWifiSubnetMask = await info.getWifiSubmask();
    String? kWifiIPv6 = await info.getWifiIPv6();

    setState(() {
      wifiIp = kWifiIp;
      wifiBroadcast = kWifiBroadcast;
      wifiGatewayIp = kWifiGatewayIp;
      wifiSubMask = kWifiSubnetMask;
      wifiIpv6 = kWifiIPv6;
    });
  }
}
