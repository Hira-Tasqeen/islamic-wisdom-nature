# Quick Deploy Script for Islamic Chemistry Website
# Run this in PowerShell

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "Islamic Chemistry & Nature Website" -ForegroundColor Green
Write-Host "Created by Hira Tasqeen" -ForegroundColor Yellow
Write-Host "========================================`n" -ForegroundColor Cyan

# Check if git is installed
if (Get-Command git -ErrorAction SilentlyContinue) {
    Write-Host "✓ Git is installed" -ForegroundColor Green
} else {
    Write-Host "✗ Git is not installed. Please install Git from https://git-scm.com/" -ForegroundColor Red
    Write-Host "`nAlternative: Use Netlify Drag & Drop (https://netlify.com)" -ForegroundColor Yellow
    pause
    exit
}

Write-Host "`nDeployment Options:" -ForegroundColor Cyan
Write-Host "1. GitHub Pages (Free, requires GitHub account)" -ForegroundColor White
Write-Host "2. Open Netlify for drag & drop deployment" -ForegroundColor White
Write-Host "3. Open Vercel for deployment" -ForegroundColor White
Write-Host "4. Exit" -ForegroundColor White

$choice = Read-Host "`nEnter your choice (1-4)"

switch ($choice) {
    "1" {
        Write-Host "`n📝 GitHub Pages Setup:" -ForegroundColor Cyan
        Write-Host "1. Go to https://github.com/new" -ForegroundColor White
        Write-Host "2. Create a repository named: islamic-chemistry-nature" -ForegroundColor Yellow
        Write-Host "3. Make it Public" -ForegroundColor White
        
        $continue = Read-Host "`nHave you created the repository? (y/n)"
        
        if ($continue -eq "y") {
            $username = Read-Host "Enter your GitHub username"
            
            Write-Host "`nInitializing Git repository..." -ForegroundColor Cyan
            git init
            git add index.html chemistry.html quotes.html gallery.html README.md
            git commit -m "Initial commit - Islamic Chemistry & Nature website"
            git branch -M main
            git remote add origin "https://github.com/$username/islamic-chemistry-nature.git"
            
            Write-Host "`nPushing to GitHub..." -ForegroundColor Cyan
            git push -u origin main
            
            Write-Host "`n✓ Pushed to GitHub!" -ForegroundColor Green
            Write-Host "`nFinal Steps:" -ForegroundColor Cyan
            Write-Host "1. Go to: https://github.com/$username/islamic-chemistry-nature/settings/pages" -ForegroundColor White
            Write-Host "2. Under 'Source', select 'main' branch" -ForegroundColor White
            Write-Host "3. Click Save" -ForegroundColor White
            Write-Host "4. Your site will be live at: https://$username.github.io/islamic-chemistry-nature/" -ForegroundColor Yellow
            
            Start-Process "https://github.com/$username/islamic-chemistry-nature/settings/pages"
        }
    }
    
    "2" {
        Write-Host "`nOpening Netlify..." -ForegroundColor Cyan
        Write-Host "Drag and drop this folder to deploy instantly!" -ForegroundColor Yellow
        Start-Process "https://app.netlify.com/drop"
    }
    
    "3" {
        Write-Host "`nOpening Vercel..." -ForegroundColor Cyan
        Start-Process "https://vercel.com/new"
    }
    
    "4" {
        Write-Host "Goodbye!" -ForegroundColor Cyan
        exit
    }
    
    default {
        Write-Host "Invalid choice. Please run the script again." -ForegroundColor Red
    }
}

Write-Host "`n========================================" -ForegroundColor Cyan
Write-Host "Deployment initiated!" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Cyan
pause
