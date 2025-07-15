import 'package:flutter/material.dart';
import 'dart:math' as math;

class ExtraTab extends StatefulWidget {
  @override
  _ExtraTabState createState() => _ExtraTabState();
}

class _ExtraTabState extends State<ExtraTab> with TickerProviderStateMixin {
  late AnimationController _pulseController;
  late AnimationController _floatingController;
  
  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();
    
    _floatingController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Program Schedule'),
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Animated Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue[100]!, Colors.white],
              ),
            ),
          ),
          
          // Floating decorative elements
          AnimatedBuilder(
            animation: _floatingController,
            builder: (context, child) {
              return Stack(
                children: [
                  // Floating circle 1
                  Positioned(
                    top: 100 + math.sin(_floatingController.value * 2 * math.pi) * 20,
                    right: 50 + math.cos(_floatingController.value * 2 * math.pi) * 15,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Floating circle 2
                  Positioned(
                    top: 200 + math.cos(_floatingController.value * 2 * math.pi + 1) * 25,
                    left: 30 + math.sin(_floatingController.value * 2 * math.pi + 1) * 10,
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Floating circle 3
                  Positioned(
                    top: 300 + math.sin(_floatingController.value * 2 * math.pi + 2) * 30,
                    right: 80 + math.cos(_floatingController.value * 2 * math.pi + 2) * 20,
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.4),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  // Floating circle 4
                  Positioned(
                    top: 400 + math.cos(_floatingController.value * 2 * math.pi + 3) * 15,
                    left: 60 + math.sin(_floatingController.value * 2 * math.pi + 3) * 25,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
          
          // Main content
          ListView(
            padding: EdgeInsets.all(16.0),
            children: [
              // Animated Date Header
              AnimatedBuilder(
                animation: _pulseController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: 1.0 + (math.sin(_pulseController.value * 2 * math.pi) * 0.03),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      margin: EdgeInsets.only(bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.blue[200]!),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.1 + (math.sin(_pulseController.value * 2 * math.pi) * 0.1)),
                            blurRadius: 8.0 + (math.sin(_pulseController.value * 2 * math.pi) * 4.0),
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Colors.blue[800],
                            size: 24,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '10th March 2022',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              
              // Schedule Items
              ScheduleItem(
                time: '10 AM to 12 Noon',
                title: 'Inauguration',
                icon: Icons.celebration,
                color: Colors.orange,
                details: [
                  'Address by dignitaries from SCTR\'s PICT',
                  'Chief Guest: Prof. L. M. Patnaik, Adjunct Professor and NASI Senior Scientist, National Institute of Advanced Studies, Indian Institute of Science Campus, Bangalore',
                  'Guest of Honour: Raj Neervannan, CTO and co-founder of AlphaSense California, USA',
                  'Keynote: Vishal Chahal, Director IBM Automation & AP Cloud Pak Labs, IBM Software Labs',
                  '"Artificial Intelligence and Automation"'
                ],
              ),
              
              ScheduleItem(
                time: '12 Noon to 1:00 PM',
                title: 'Break',
                icon: Icons.coffee,
                color: Colors.brown,
                details: [],
              ),
              
              ScheduleItem(
                time: '1 PM to 3 PM',
                title: 'Workshop Session-I',
                icon: Icons.work_outline,
                color: Colors.green,
                details: [
                  'Workshop on "Research Trends in Optical Technologies and wireless communication (5G and Beyond)"',
                  'Paper Presentation in parallel tracks',
                  '"Accelerating AI adoption with IBM Technologies" - Session-I',
                  'by Nagarjuna Suthathaling, Kanish Malhotra and Ramkumar Ramalingam from IBM Software'
                ],
              ),
              
              ScheduleItem(
                time: '3 PM to 4 PM',
                title: 'Workshop Session-II',
                icon: Icons.settings,
                color: Colors.purple,
                details: [
                  'Workshop on "Research Trends in Optical Technologies and wireless communication (5G and Beyond)"',
                  '"Fixed Wireless for Broadband: Challenges and Approaches" by Dr. Rabin Patra, Co-founder at Tarana Wireless, Berkeley, California, United States'
                ],
              ),
              
              ScheduleItem(
                time: '4 PM to 5:30 PM',
                title: 'Workshop Session-III',
                icon: Icons.group,
                color: Colors.teal,
                details: [
                  'Workshop on "Research Trends in Optical Technologies and wireless communication (5G and Beyond)"',
                  'Panel discussion on "Rethinking Cybersecurity: How secure is your digital world?"',
                  'Panelists: Dr. Sachin Lodha, Mr. Amar Kalvitkar, Dr. Shravani Shahapure, Mr. Sameer Abhrao',
                  'Moderator: Mr. Ameya Deshpande'
                ],
              ),
              
              ScheduleItem(
                time: '6 PM to 8 PM',
                title: 'Containerization & Cloud Deployment',
                icon: Icons.cloud_upload,
                color: Colors.indigo,
                details: [
                  'Workshop on "Containerization & Cloud Deployment of Application"',
                  'by Tanmasi Amale, Software Engineer, AlphaSense, Vaibhav Sarja, Software Engineer, AlphaSense',
                  'and Swapnil Pingle, QA Lead, AlphaSense'
                ],
              ),
              
              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }
}

class ScheduleItem extends StatefulWidget {
  final String time;
  final String title;
  final IconData icon;
  final Color color;
  final List<String> details;

  const ScheduleItem({
    Key? key,
    required this.time,
    required this.title,
    required this.icon,
    required this.color,
    required this.details,
  }) : super(key: key);

  @override
  _ScheduleItemState createState() => _ScheduleItemState();
}

class _ScheduleItemState extends State<ScheduleItem>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  late AnimationController _controller;
  late AnimationController _shimmerController;
  late AnimationController _bounceController;
  late Animation<double> _expandAnimation;
  late Animation<double> _iconAnimation;
  late Animation<double> _shimmerAnimation;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 400),
      vsync: this,
    );
    
    _shimmerController = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    )..repeat();
    
    _bounceController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    
    _expandAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    
    _iconAnimation = Tween<double>(
      begin: 0.0,
      end: 0.5,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    
    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOut,
    ));
    
    _bounceAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _bounceController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    _shimmerController.dispose();
    _bounceController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      isExpanded = !isExpanded;
      _bounceController.forward().then((_) {
        _bounceController.reverse();
      });
      if (isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _bounceAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _bounceAnimation.value,
          child: Container(
            margin: EdgeInsets.only(bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.2),
                  blurRadius: 8.0,
                  offset: Offset(0, 4),
                ),
              ],
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Stack(
                children: [
                  // Shimmer effect
                  AnimatedBuilder(
                    animation: _shimmerAnimation,
                    builder: (context, child) {
                      return Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: [
                                (_shimmerAnimation.value - 0.3).clamp(0.0, 1.0),
                                _shimmerAnimation.value.clamp(0.0, 1.0),
                                (_shimmerAnimation.value + 0.3).clamp(0.0, 1.0),
                              ],
                              colors: [
                                Colors.transparent,
                                Colors.white.withOpacity(0.4),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  
                  // Main content
                  Column(
                    children: [
                      InkWell(
                        onTap: widget.details.isNotEmpty ? _toggleExpanded : null,
                        child: Container(
                          padding: EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Animated Icon
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: widget.color.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(color: widget.color.withOpacity(0.3)),
                                ),
                                child: Icon(
                                  widget.icon,
                                  color: widget.color,
                                  size: 24,
                                ),
                              ),
                              
                              SizedBox(width: 16.0),
                              
                              // Time Column
                              Container(
                                width: 100,
                                padding: EdgeInsets.all(12.0),
                                decoration: BoxDecoration(
                                  color: Colors.blue[50],
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(color: Colors.blue[200]!),
                                ),
                                child: Text(
                                  widget.time,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue[800],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              
                              SizedBox(width: 16.0),
                              
                              // Title Column
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.title,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                    if (widget.details.isNotEmpty)
                                      SizedBox(height: 4.0),
                                    if (widget.details.isNotEmpty)
                                      Text(
                                        'Tap to ${isExpanded ? 'collapse' : 'expand'} details',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.blue[600],
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              
                              // Expand/Collapse Icon
                              if (widget.details.isNotEmpty)
                                AnimatedBuilder(
                                  animation: _iconAnimation,
                                  builder: (context, child) {
                                    return Transform.rotate(
                                      angle: _iconAnimation.value * 3.14159,
                                      child: Icon(
                                        Icons.expand_more,
                                        color: Colors.blue[600],
                                        size: 24,
                                      ),
                                    );
                                  },
                                ),
                            ],
                          ),
                        ),
                      ),
                      
                      // Expandable Details Section
                      if (widget.details.isNotEmpty)
                        SizeTransition(
                          sizeFactor: _expandAnimation,
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
                            decoration: BoxDecoration(
                              color: Colors.blue[25],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Divider(color: Colors.blue[200]),
                                SizedBox(height: 8.0),
                                Row(
                                  children: [
                                    Icon(Icons.info_outline, 
                                         color: Colors.blue[800], 
                                         size: 16),
                                    SizedBox(width: 8),
                                    Text(
                                      'Event Details',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.0),
                                ...widget.details.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final detail = entry.value;
                                  return TweenAnimationBuilder<double>(
                                    duration: Duration(milliseconds: 300 + (index * 100)),
                                    tween: Tween(begin: 0.0, end: 1.0),
                                    builder: (context, value, child) {
                                      return Transform.translate(
                                        offset: Offset(20 * (1 - value), 0),
                                        child: Opacity(
                                          opacity: value,
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 8.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(top: 6.0, right: 8.0),
                                                  width: 6.0,
                                                  height: 6.0,
                                                  decoration: BoxDecoration(
                                                    color: widget.color,
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    detail,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.blue[700],
                                                      height: 1.4,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
   