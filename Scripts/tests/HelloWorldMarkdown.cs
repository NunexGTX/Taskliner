using Godot;
using System;
using Markdig;

public partial class HelloWorldMarkdown : Node
{
	public override void _Ready()
	{
		var pipeline = new MarkdownPipelineBuilder().UseAdvancedExtensions().Build();
		var doc = Markdown.Parse("# Hello **world**", pipeline);
		GD.Print(doc.Count); // should print 1
	}
}
